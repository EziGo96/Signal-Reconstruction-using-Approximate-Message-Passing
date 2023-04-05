%d
function [x_hat,d] = denoise(v,var_x,varz,theta)
    x_hat=zeros(2000,1);
    for i =1:length(v)
        x_hat(i)=(theta*exp(-(v(i,1)-1)^2/(2*varz))-theta*exp(-(v(i,1)+1)^2/(2*varz)))/(theta*exp(-(v(i,1)-1)^2/(2*varz))+theta*exp(-(v(i,1)+1)^2/(2*varz))+(1-2*theta)*exp(-v(i,1)^2/(2*varz)));
    end
    % empirical derivative
    del_v=1e-10; % perturbation
    v_plus = v+del_v;
    x_hat_plus=zeros(2000,1);
    for i =1:length(v)
        x_hat_plus(i)=(theta*exp(-(v_plus(i,1)-1)^2/(2*varz))-theta*exp(-(v_plus(i,1)+1)^2/(2*varz)))/(theta*exp(-(v_plus(i,1)-1)^2/(2*varz))+theta*exp(-(v_plus(i,1)+1)^2/(2*varz))+(1-2*theta)*exp(-v_plus(i,1)^2/(2*varz)));
    end
    d=(x_hat_plus-x_hat)/del_v;
end