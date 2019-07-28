#pragma once
#include "Maths/Vector.h"
class Camera
{
public:
	Camera(Vector origin, Vector target, Vector upGuide, float fov, float aspectRatio);
	void update(Vector origin, Vector target, Vector upGuide, float fov, float aspectRatio);

	Vector mOrigin;
	Vector mForwards;
	Vector mUp;
	Vector mRight;
	Vector camLook;
	float mWidth, mHeight;
	float maspectRatio;
	float mFov;
private:
};
