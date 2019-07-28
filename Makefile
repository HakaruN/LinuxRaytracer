All: Raytracer

Raytracer: Application.o Colour.o Camera.o RayTracer.o Fragment.o Light.o Ray.o Plain.o Sphere.o Triangle.o Maths.o Matrix.o Vector.o imgui.o imgui_draw.o imgui_demo.o imgui_widgets.o imgui_impl_opengl3.o imgui_impl_glfw.o
	g++ -O3 -std=c++11 imgui.o imgui_draw.o imgui_demo.o imgui_impl_opengl3.o imgui_impl_glfw.o imgui_widgets.o Application.o Colour.o Camera.o RayTracer.o Fragment.o Light.o Ray.o Plain.o Sphere.o Triangle.o Maths.o Matrix.o Vector.o -lGL -lGLU -lglfw3 -lGLEW -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW  -o render

Application.o: Raytracer/src/Application.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Application.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

Colour.o: Raytracer/src/Colour.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Colour.cpp

Camera.o: Raytracer/src/Camera.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Camera.cpp  -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

RayTracer.o: Raytracer/src/RayTracer.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/RayTracer.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor


Fragment.o: Raytracer/src/Fragment.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Fragment.cpp  -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Light.o: Raytracer/src/Light.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Light.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Ray.o: Raytracer/src/Ray.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Ray.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

##Next are Geometry

Plain.o: Raytracer/src/Geometry/Plain.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Plain.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Sphere.o: Raytracer/src/Geometry/Sphere.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Sphere.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Triangle.o: Raytracer/src/Geometry/Triangle.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Geometry/Triangle.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

##Next are Maths related classes

Maths.o: Raytracer/src/Maths/Maths.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Maths.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Matrix.o: Raytracer/src/Maths/Matrix.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Matrix.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

Vector.o: Raytracer/src/Maths/Vector.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/Maths/Vector.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor

##Next is imgui
imgui.o: Raytracer/src/vendor/imgui/imgui.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

imgui_demo.o: Raytracer/src/vendor/imgui/imgui_demo.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_demo.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

imgui_draw.o: Raytracer/src/vendor/imgui/imgui_draw.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_draw.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

imgui_widgets.o: Raytracer/src/vendor/imgui/imgui_widgets.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_widgets.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

imgui_impl_opengl3.o: Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_opengl3.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW

imgui_impl_glfw.o: Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp
	g++ -O3 -std=c++11 -c Raytracer/src/vendor/imgui/imgui_impl_glfw.cpp -lGL -lGLU -lglfw3 -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -lGLEW
