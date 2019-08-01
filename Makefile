All: Raytracer

Raytracer: objectFiles/Application.o objectFiles/Colour.o objectFiles/Camera.o objectFiles/RayTracer.o objectFiles/Fragment.o objectFiles/Light.o objectFiles/Ray.o objectFiles/Plain.o objectFiles/Sphere.o objectFiles/Triangle.o objectFiles/Maths.o objectFiles/Matrix.o objectFiles/Vector.o objectFiles/imgui.o objectFiles/imgui_draw.o objectFiles/imgui_demo.o objectFiles/imgui_widgets.o objectFiles/imgui_impl_opengl3.o objectFiles/imgui_impl_glfw.o
	g++ -O3 -std=c++11 objectFiles/imgui.o objectFiles/imgui_draw.o objectFiles/imgui_demo.o objectFiles/imgui_impl_opengl3.o objectFiles/imgui_impl_glfw.o objectFiles/imgui_widgets.o objectFiles/Application.o objectFiles/Colour.o objectFiles/Camera.o objectFiles/RayTracer.o objectFiles/Fragment.o objectFiles/Light.o objectFiles/Ray.o objectFiles/Plain.o objectFiles/Sphere.o objectFiles/Triangle.o objectFiles/Maths.o objectFiles/Matrix.o objectFiles/Vector.o -lGL -lGLU -lglfw3 -lGLEW -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW  -o render

Application.o: Raytracer/src/Application.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Application.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW -s -o objectFiles/Application.o


Colour.o: Raytracer/src/Colour.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Colour.cpp -s -o objectFiles/Colour.o

Camera.o: Raytracer/src/Camera.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Camera.cpp -s -o objectFiles/Camera.o

RayTracer.o: Raytracer/src/RayTracer.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/RayTracer.cpp -s -o objectFiles/RayTracer.o


Fragment.o: Raytracer/src/Fragment.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Fragment.cpp -s -o objectFiles/Fragment.o

Light.o: Raytracer/src/Light.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Light.cpp -s -o objectFiles/Light.o

Ray.o: Raytracer/src/Ray.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Ray.cpp -s -o objectFiles/Ray.o

##Next are Geometry

Plain.o: Raytracer/src/Geometry/Plain.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Plain.cpp -s -o objectFiles/Plain.o

Sphere.o: Raytracer/src/Geometry/Sphere.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Sphere.cpp -s -o objectFiles/Sphere.o

Triangle.o: Raytracer/src/Geometry/Triangle.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Triangle.cpp -s -o objectFiles/Triangle.o

##Next are Maths related classes

Maths.o: Raytracer/src/Maths/Maths.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Maths.cpp -s -o objectFiles/Maths.o

Matrix.o: Raytracer/src/Maths/Matrix.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Matrix.cpp -s -o objectFiles/Matrix.o

Vector.o: Raytracer/src/Maths/Vector.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Vector.cpp -s -o objectFiles/Vector.o

##Next is imgui
imgui.o: Raytracer/src/vendor/imgui/imgui.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui.cpp -s -o objectFiles/imgui.o

imgui_demo.o: Raytracer/src/vendor/imgui/imgui_demo.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_demo.cpp -s -o objectFiles/imgui_demo.o

imgui_draw.o: Raytracer/src/vendor/imgui/imgui_draw.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_draw.cpp -s -o objectFiles/imgui_draw.o

imgui_widgets.o: Raytracer/src/vendor/imgui/imgui_widgets.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_widgets.cpp -s -o objectFiles/imgui_widgets.o

imgui_impl_opengl3.o: Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp -s -o objectFiles/imgui_impl_opengl3.o

imgui_impl_glfw.o: Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp
	g++ -s -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp -o objectFiles/imgui_impl_glfw.o
