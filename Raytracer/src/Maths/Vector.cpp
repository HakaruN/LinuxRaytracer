#include "Vector.h"	

//float mX, myY, mzZ;
	Vector::Vector() { mX = mY = mZ = 0; }
	Vector::Vector(float x, float y, float z) { mX = x, mY = y, mZ = z; }

	void Vector::SetX(float x) {  mX = x; }
	void Vector::SetY(float y) {  mY = y; }
	void Vector::SetZ(float z) {  mZ = z; }
