function graph_2d (x_vec, y_mtx, dim_xy)
% give it the enumerated x-vector                  1xn
%             all the y values you want plotted    nxm
%             dimensions x by y                    [n,m]  "length of x, # of y functions"

    buf = 1;
    dots = 500;
    inp_rng = [min(x_vec, [], 'all'), max(x_vec, [], 'all')];
    out_rng = [min(y_mtx, [], 'all'), max(y_mtx, [], 'all')];
    
    figure('Position',[20, 20, 700, 700]);
    hold on;
    grid on;
    %axis equal;
    view(2); % 2 for 2D
    tiStr = sprintf('your graph');
    title(tiStr, 'fontsize', 16); 
    xlabel('x');
    ylabel('y');   
    xlim([inp_rng(1)-buf, inp_rng(2)+buf]);
    ylim([out_rng(1)-buf, out_rng(2)+buf]);
    x_axis = linspace(inp_rng(1)-buf , inp_rng(2)+buf , dots);
    y_axis = linspace(out_rng(1)-buf , out_rng(2)+buf , dots);
    plot(x_axis  , 0*y_axis, 'k', 'linewidth', 1);
    plot(0*x_axis, y_axis  , 'k', 'linewidth', 1);        
    plot(inp_rng(2)+buf, 0      , 'y.', 'markersize', 20, 'linewidth', 10); % +x / inputs
    plot(0      , out_rng(2)+buf, 'y.', 'markersize', 20, 'linewidth', 10); % +y / outputs
    
    for ii = 1:1:dim_xy(2)
        if (ii == 1)
            plot(x_vec, y_mtx(ii,:)  , 'b', 'markersize', 5); 
        elseif (ii == 2)
            plot(x_vec, y_mtx(ii,:)  , 'r', 'markersize', 5);
        elseif (ii == 3)
            plot(x_vec, y_mtx(ii,:)  , 'g', 'markersize', 5);
        elseif (ii == 4)
            plot(x_vec, y_mtx(ii,:)  , 'c', 'markersize', 5);
        elseif (ii == 4)
            plot(x_vec, y_mtx(ii,:)  , 'o', 'markersize', 5);
        else
            plot(x_vec, y_mtx(ii,:)  , 'k', 'markersize', 5);
        end
    end
end