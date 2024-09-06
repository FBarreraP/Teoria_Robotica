function [theta1, theta2] = InverseKinematics(l1,l2,Px,Py)

    b = sqrt(Px^2+Py^2);
    % Theta 2
    cos_theta2 = (b^2-l2^2-l1^2)/(2*l1*l2);
    sen_theta2 = sqrt(1-(cos_theta2)^2);%(+)codo abajo y (-)codo arriba
    theta2 = atan2(sen_theta2, cos_theta2);
    fprintf('theta 2 = %.4f \n',radtodeg(theta2));
    % Theta 1
    alpha = atan2(Py,Px);
    phi = atan2(l2*sen_theta2, l1+l2*cos_theta2);
    theta1 = alpha - phi;
    if theta1 <= -pi
        theta1 = (2*pi)+theta1;
    end
    fprintf('theta 1 = %.4f \n',radtodeg(theta1));

end