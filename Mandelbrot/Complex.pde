class Complex {
	float a;
	float b;
	
// Methods

	Complex() {
		a = 0;
		b = 0;
	}
	
	Complex(float x, float y) {
		a = x;
		b = y;
	}
	
	float re() {
		return a;
	}
	
	float im() {
		return b;
	}
	
	void print() {
		println(a+"+"+b+"i\t(" + mod() + ")");
	}
	
	void square() {
		float a_temp = pow(a,2) - pow(b,2);
		float b_temp = 2*a*b;
		a = a_temp;
		b = b_temp;
	}
	
	float mod() {
		return pow(a,2) + pow(b,2);
	}
	
	void add(Complex other) {
		a += other.a;
		b += other.b;
	}
	
	void times(Complex other) {
		float a_temp = a*other.a - b*other.b;
		float b_temp = b*other.a + a*other.b;
		a = a_temp;
		b = b_temp;
	}
	
	void iterate(Complex c) {
		square();
		add(c);
	}
}