#pragma once
#include "Ray.h"
#include "Maths/Vector.h"
#include "Maths/Maths.h"
#include "Colour.h"


class Fragment
{
public:
	Fragment(int x, int y, Ray& ray, float& t);

	float getT();
	Ray& getRay();
	Colour getColour();
	bool getShadow();

	void setT(float t);
	void setColour(Colour colour);
	void setShadow(bool shadowed);

	int bounces = 2;

private:
	int mx, my;
	Ray& mray;
	float& mt;

	bool mIsShadowed;


	Colour mColour;
};
