function y = fcw(T)
	display(T)
	Tid = [0, 55, 70, 100, 200, 400, 1000, 2000];
    cwd = [0.2, 0.12, 0.1, 0.08, 0.05, 0.03, 0.02, 0.016];
    [xx, yy] = linearize_samples(Tid, cwd, 100);
    y = spline_interpolation(xx, yy, 0, 1/2000, T);
end