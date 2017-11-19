function show_temperature_plot_details(h, A, mb, mw, cb)
% ustawienie parametrów pomagających interpretować
% przedstawione wykresy
    legend('show')
    title(sprintf('h = %f, A = %f, m_b = %f,  m_w = %f, c_b = %f', h, A, mb, mw, cb))
    xlabel('Czas')
    ylabel('Temperatura')
    grid on
end

