function [q,qd,qdd] = TraTra(q0, qf, t)

    tf = max(t(:));
    Wmax = 1.5*((qf-q0)/tf);
    tb = (q0-qf+ Wmax*tf)/Wmax;
    alpha = Wmax/tb;
    
    q = zeros(length(t),1);
    qd = zeros(length(t),1);
    qdd = zeros(length(t),1);
    
    for i = 1:length(t)
        if t(i) <= tb
            % initial blend
            q(i) = q0 + alpha/2*t(i)^2;
            qd(i) = alpha*t(i);
            qdd(i) = alpha;
        elseif t(i) <= (tf-tb)
            % linear motion
            q(i) = (qf+q0-Wmax*tf)/2 + Wmax*t(i);
            qd(i) = Wmax;
            qdd(i) = 0;
        else
            % final blend
            q(i) = qf - alpha/2*tf^2 + alpha*tf*t(i) - alpha/2*t(i)^2;
            qd(i) = alpha*tf - alpha*t(i);
            qdd(i) = -alpha;
        end
    end
end