function zad_trzy
  pause on
  h = 50;
  A = 0.0109; 
  mb = 0.4; 
  % mw = 19.9100;
  cb = 0.22;
  tspan  = [0 0.5];
  ic = [1200 65];
  calc = @(x,y,z) euler_modified(x,y,z);

  mw = linspace(19.6, 19.7, 50);
  time = zeros(1, size(mw,2));
  for i=1:size(mw,2)
  	mw(i)
   	[t, y] = state(h, A, mb, cb, mw(i), ic, tspan, calc);
  	for j=1:size(y,2)
  		if y(1,j) <= 200
  			y(1,j)
  			time(i) = t(j);
  			break
  		end
  	end
  	pause(0.001)
  	plot(mw, time)
  end
end