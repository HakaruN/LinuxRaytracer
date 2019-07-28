#include "RayTracer.h"

#include "Colour.h"

#include "Camera.h"

#include "Ray.h"

#include "Geometry/Sphere.h"

#include "Maths/Maths.h"

#include "Geometry/Triangle.h"

#include "Renderable.h"

#include "Fragment.h"



#include <iostream>

#include <fstream>

#include <chrono>

#include <thread>

#include <vector>



static bool frameParity = true;

	

void RayTracer::runRayTracer(int width, int height, int coloursPerPixel, float* frameBuffer, bool depthRender, Colour& background, Camera& camera, Light& lighting, std::vector<Renderable*>* renderables, bool isCheckerboarding, bool perspective, bool multithreaded)

{

	float aspectRatio = (float)width / (float)height;



	const int threadsWide = 8;//number of threads used to split the width of the render into tiles

	const int threadsHigh = 5;//number of threads used to split the height of the render into tiles



	const int concurentThreadsSupported = threadsWide * threadsHigh;

	std::thread renderThreads[concurentThreadsSupported];



	if (multithreaded)

	{

		for (unsigned short wide = 0; wide < concurentThreadsSupported; wide = wide + threadsWide)

		{			

			for (unsigned short h = 0; h < threadsWide; h++)

			{

				renderThreads[wide + h] = std::thread(Render, (wide * (width / concurentThreadsSupported)), (wide + threadsWide) * (width / concurentThreadsSupported), h * height / threadsWide, (h+1) * height / threadsWide, width, height, coloursPerPixel, aspectRatio, perspective, isCheckerboarding, frameParity, frameBuffer, depthRender, std::ref(background), std::ref(camera), std::ref(lighting), renderables);

			}

		}

		for (unsigned short j = 0; j < concurentThreadsSupported; j = j + threadsWide)

		{

			for (unsigned short k = 0; k < threadsWide; k++)

			{

				renderThreads[j + k].join();



			}

		}

	}

	else

	{

		Render(0, width,0 , height, width, height, coloursPerPixel, aspectRatio, perspective, isCheckerboarding, frameParity, frameBuffer, depthRender, background, camera, std::ref(lighting), renderables);

	}



	if (frameParity)

	{

		frameParity = false;

	}

	else

	{

		frameParity = true;

	}

}

inline void RayTracer::ClearPixel(float* frameBuffer, int x, int y, int imageWidth, int coloursPerPixel, Colour& background)

{

	frameBuffer[((y * imageWidth) + x) * coloursPerPixel + 0] = background.GetRed();

	frameBuffer[((y * imageWidth) + x) * coloursPerPixel + 1] = background.GetGreen();

	frameBuffer[((y * imageWidth) + x) * coloursPerPixel + 2] = background.GetBlue();

}

inline void RayTracer::CheckIntersect(Ray& ray, float& t, Light& lighting, std::vector<Renderable*>* renderables, int renderableIndex, int coloursPerPixel, float* frameBuffer, bool depthRender, int bufferWidth, int x, int y)

{

	Fragment fragment(x, y, ray, t);



	if (renderables->at(renderableIndex)->Intersects(fragment, renderables, lighting) )

	{

		//point of intersection		

		Vector point = (fragment.getRay().GetOrigin() + (fragment.getRay().GetDirection() * fragment.getT()));





		//colour the pixel the right colour

		Vector light = (Vector::vectorBetweenVectors(lighting.getPosition(), point)).Normalise();

		Vector normal = (renderables->at(renderableIndex)->GetNormal(point)).Normalise();





		float ft = Maths::dot(light, normal);



		if (depthRender)

		{

			frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 0] = 15 / t;

			frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 1] = 15 / t;

			frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 2] = 15 / t;

		}

		else

		{

			if (fragment.getShadow())

			{

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 0] = 0;

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 1] = 0;

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 2] = 0;

			}

			else

			{

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 0] = ((renderables->at(renderableIndex)->GetColour().GetRed() + lighting.getColour().GetRed() * ft) / 256);

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 1] = ((renderables->at(renderableIndex)->GetColour().GetGreen() + lighting.getColour().GetGreen() * ft) / 256);

				frameBuffer[((y * bufferWidth) + x) * coloursPerPixel + 2] = ((renderables->at(renderableIndex)->GetColour().GetBlue() + lighting.getColour().GetBlue() * ft) / 256);

			}

			

		}

	}

}

inline void RayTracer::Render(int xStart , int xEnd, int yStart, int yEnd, int width, int height, int coloursPerPixel, float aspectRatio, bool perspective, bool checkerboarding, bool frameParity, float* frameBuffer, bool depthRender, Colour& background, Camera& camera, Light &lighting, std::vector<Renderable*>* renderables)

{

	float i,j;



	if (checkerboarding)

	{

		if (frameParity)

		{

			for (int x = xStart; x <= xEnd; x = x + 2)

			{

				// i is the normalised screen coord in the x direction

				i = ((2.0f * x) / width) - 1.0f;





				for (int y = yStart; y < yEnd;  y++)

				{

					float dist = 1000000000000;

					// j is the normalised screen coord in the y direction

					//float j = ((-2.0f * y) / height) + 1.0f;

					j = ((2.0f * y) / height) - 1.0f;



					Vector direction = (camera.mForwards + ((camera.mRight * camera.mWidth) * i) + ((camera.mUp * camera.mHeight) * j)).Normalise();

					RayTracer::ClearPixel(frameBuffer, x, y, width, coloursPerPixel, background);//clears the frameBuffer at x,y with the background colour

					Vector screenCords(i, j, camera.mOrigin.GetZ());

					Ray ray = RayTracer::FireRay(screenCords, direction);



					for (unsigned short rendOjb = 0; rendOjb < renderables->size(); rendOjb++)

					{

						RayTracer::CheckIntersect(ray, dist, lighting, renderables, rendOjb, coloursPerPixel, frameBuffer, depthRender, width, x, y);

					}

				}

			}

		}

		else

		{

			for (int x = xStart + 1; x <= xEnd; x = x + 2)

			{

				// i is the normalised screen coord in the x direction

				i = ((2.0f * x) / width) - 1.0f;



				for (int y = yStart; y < yEnd;  y++)

				{

					float dist = 1000000000000;

					// j is the normalised screen coord in the y direction

					//float j = ((-2.0f * y) / height) + 1.0f;

					j = ((2.0f * y) / height) - 1.0f;



					Vector direction = (camera.mForwards + ((camera.mRight * camera.mWidth) * i) + ((camera.mUp * camera.mHeight) * j)).Normalise();

					RayTracer::ClearPixel(frameBuffer, x, y, width, coloursPerPixel, background);//clears the frameBuffer at x,y with the background colour

					Vector screenCords(i, j, camera.mOrigin.GetZ());

					Ray ray = RayTracer::FireRay(screenCords, direction);



					for (unsigned short rendOjb = 0; rendOjb < renderables->size(); rendOjb++)

					{

						RayTracer::CheckIntersect(ray, dist, lighting, renderables, rendOjb, coloursPerPixel, frameBuffer, depthRender, width, x, y);

					}

				}

			}

		}

	}

	else

	{

		for (int x = xStart; x < xEnd; x++)

		{		

			// i is the normalised screen coord in the x direction

			i = ((2.0f * x) / width) - 1.0f;





			for (int y = yStart; y < yEnd; y++)

			{

				float dist = 1000000000000;

				// j is the normalised screen coord in the y direction

				//j = ((-2.0f * y) / height) + 1.0f;//This will lead to the image being flipped upside down

				j = ((2.0f * y) / height) - 1.0f;



				Vector direction = (camera.mForwards + ((camera.mRight * camera.mWidth) * i) + ((camera.mUp * camera.mHeight) * j)).Normalise();

				RayTracer::ClearPixel(frameBuffer, x, y, width, coloursPerPixel, background);//clears the frameBuffer at x,y with the background colour

				Vector screenCords(i, j, camera.mOrigin.GetZ());

				Ray ray = RayTracer::FireRay(screenCords, direction);



				for (unsigned short rendOjb = 0; rendOjb < renderables->size(); rendOjb++)

				{

					RayTracer::CheckIntersect(ray, dist, lighting, renderables, rendOjb, coloursPerPixel, frameBuffer, depthRender, width, x, y);

				}

			}

		}	

	}

}

inline Ray RayTracer::FireRay(Vector& pixelCoords, Vector& direction)

{	

	//std::cout << "Pixel cords: " << pixelCoords.GetX() << "," << pixelCoords.GetY() << "," << pixelCoords.GetZ() << "," << std::endl;

	return (Ray(pixelCoords, direction));//send a ray through the pixels	

}