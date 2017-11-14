function zad_trzy
% zadanie 3:
% - znalezienie miejsca zerowego funkcji
  clear all
  pause on
  hold off

  h = 50;
  A = 0.0109; 
  mb = 0.4; 
  cb = 0.22;
  tspan  = [0 0.6];
  ic = [1200 65];
  calc = @(x,y,z) euler_modified(x,y,z);

  diff = 1e-3;
  equation = @(x) minimal_time(h, A, mb, cb, x, ic, tspan, calc) - 0.4;
  condition = @(x) abs(x) <= diff;
  [zeros, values] = find_zero(equation, condition, 0.0, 30.0, 1, 0, 0);
  
  figure(4)
  scatter(zeros, values)

end

function t = minimal_time(h, A, mb, cb, mw, ic, tspan, calc) 
    t = Inf;
    [tt, y] = state(h, A, mb, cb, mw, ic, tspan, calc);
    for j=1:size(y, 2)
      if y(1,j) <= 200
        t = tt(j);
        return
      end
    end
end


function [x, val] = find_zero(equation, condition, x_1, x_2, step, x, val)
    fprintf('<%.30f, %.30f>\n', x_1, x_2);
    val_2 = equation(x_2);
    c = condition(val_2);
    x(step) = x_2;
    val(step) = val_2;
    step = step + 1;
    if c % warunek zakończenia szukania
      return
    else 
      x_mid = (x_2 + x_1)/2.0;
      val_mid = equation(x_mid);

      if x_mid == x_1 || x_mid == x_2
        x(step) = x_mid;
        val(step) = val_mid;
        return
      end

      val_1 = equation(x_1);
      
      if sign(val_1) ~= sign(val_mid) % jeżeli funkcja zmienia wartość w przedziale x_1 x_mid
        [x, val] = find_zero(equation, condition, x_1, x_mid, step, x, val);
      elseif sign(val_2) ~= sign(val_mid) % jeżeli funkcja zmienia wartość w przedziale x_2 x_mid
        [x, val] = find_zero(equation, condition, x_mid, x_2, step, x, val);
      else % jeżeli funkcja nie zmienia wartości
        x = Inf;
        val = Inf;
      end
    end
end



