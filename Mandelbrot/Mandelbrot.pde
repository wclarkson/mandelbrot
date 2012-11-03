Complex orbit = new Complex();

float re_min = -2;
float re_max = 1;
float im_min = -1.5;
float im_max = 1.5;

float res = 1;
float max_dist = 100;
int cutoff = 20;

float zoom_factor = 2;

int escapeTime(Complex c) {
	Complex temp = new Complex(0,0);
	int counter = 0;
	while ((counter<cutoff)) {
		if (temp.mod()>max_dist) {
			return counter;
		}
		temp.iterate(c);
		counter++;
	}
	return counter;
}

float normIterCount(Complex c) {
	Complex temp = new Complex(0,0);
	int counter = 0;
	while ((counter<cutoff)&&(temp.mod()<max_dist)) {
		temp.iterate(c);
		counter++;
	}
	return (counter - log(log(temp.mod())/log(max_dist))/log(2));
}

boolean inMandelbrot(Complex c) {
	Complex temp = new Complex(0,0);
	int counter = 0;
	while ((counter<cutoff)&&(temp.mod()<max_dist)) {
		temp.iterate(c);
		counter++;
	}
	if (counter==cutoff) {
		return true;
	} else {
		return false;
	}
}

void drawMandelbrot() {
	for (int i = 0; i<width; i+=res){
		for (int j = 0; j<height; j+=res){
			float x = map(i,0,width-1,re_min,re_max);
			float y = map(j,0,height-1,im_min,im_max);
			Complex z = new Complex(x,y);
			
			fill(map(escapeTime(z),0,cutoff,150,220),100,100);
//			fill(map(normIterCount(z),0,cutoff,0,360),100,100);
			if (inMandelbrot(z)) { fill(0); }
			rect(i,j,res,res);
			println("Completed cell: (" + x + "," + y + ")");
		}
	}
}

void setup(){
	background(100);
	size(300,300);
	colorMode(HSB,360,100,100);
	noStroke();
	drawMandelbrot();	
}

void draw(){ }

void mouseClicked() {
	float re_center = map(mouseX,0,width,re_min,re_max);
	float im_center = map(mouseY,0,height,im_min,im_max);
	float re_width = (re_max - re_min)/zoom_factor;
	float im_height = (im_max - im_min)/zoom_factor;
	re_min = re_center - re_width/2;
	re_max = re_center + re_width/2;
	im_min = im_center - im_height/2;
	im_max = im_center + im_height/2;
	drawMandelbrot();
}









