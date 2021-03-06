package com.tma.exercises.oop.exercise02;

public class MyPoint {
	private int x = 0;
	private int y = 0;

	public MyPoint() {
		super();
	}

	public MyPoint(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int[] getXY() {
		int[] xy = { x, y };
		return xy;
	}

	public void setXY(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public String toString() {
		return "(" + x + ", " + y + ")";
	}

	public double distance(int x, int y) {
		return Math.sqrt((this.x - x) * (this.x - x) + (this.y - y) * (this.y - y));
	}

	public double distance(MyPoint anthor) {
		return Math.sqrt((this.x - anthor.x) * (this.x - anthor.x) + (this.y - anthor.y) * (this.y - anthor.y));
	}

	public double distance() {
		return Math.sqrt(x * x + y * y);
	}
}
