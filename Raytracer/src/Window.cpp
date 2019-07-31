#include"Window.h"



GLFWwindow* Window::getWindow()
{
    return mWindow;
}

int Window::Init()
{
    	if (!glfwInit())
		    return -1;
        
        return 1;
}

