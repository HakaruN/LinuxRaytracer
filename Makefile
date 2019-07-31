All: Raytracer

Raytracer: Application.o Colour.o Camera.o RayTracer.o Fragment.o Light.o Ray.o Plain.o Sphere.o Triangle.o Maths.o Matrix.o Vector.o imgui.o imgui_draw.o imgui_demo.o imgui_widgets.o imgui_impl_opengl3.o imgui_impl_glfw.o
	g++ -O3 -std=c++11 imgui.o imgui_draw.o imgui_demo.o imgui_impl_opengl3.o imgui_impl_glfw.o imgui_widgets.o Application.o Colour.o Camera.o RayTracer.o Fragment.o Light.o Ray.o Plain.o Sphere.o Triangle.o Maths.o Matrix.o Vector.o -lGL -lGLU -lglfw3 -lGLEW -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW  -o render

Application.o: Raytracer/src/Application.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Application.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW


Colour.o: Raytracer/src/Colour.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Colour.cpp

Camera.o: Raytracer/src/Camera.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Camera.cpp

RayTracer.o: Raytracer/src/RayTracer.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/RayTracer.cpp


Fragment.o: Raytracer/src/Fragment.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Fragment.cpp

Light.o: Raytracer/src/Light.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Light.cpp

Ray.o: Raytracer/src/Ray.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Ray.cpp

##Next are Geometry

Plain.o: Raytracer/src/Geometry/Plain.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Plain.cpp

Sphere.o: Raytracer/src/Geometry/Sphere.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Sphere.cpp

Triangle.o: Raytracer/src/Geometry/Triangle.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Triangle.cpp

##Next are Maths related classes

Maths.o: Raytracer/src/Maths/Maths.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Maths.cpp

Matrix.o: Raytracer/src/Maths/Matrix.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Matrix.cpp

Vector.o: Raytracer/src/Maths/Vector.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Vector.cpp

##Next is imgui
imgui.o: Raytracer/src/vendor/imgui/imgui.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui.cpp

imgui_demo.o: Raytracer/src/vendor/imgui/imgui_demo.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_demo.cpp

imgui_draw.o: Raytracer/src/vendor/imgui/imgui_draw.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_draw.cpp

imgui_widgets.o: Raytracer/src/vendor/imgui/imgui_widgets.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_widgets.cpp

imgui_impl_opengl3.o: Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp

imgui_impl_glfw.o: Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp
