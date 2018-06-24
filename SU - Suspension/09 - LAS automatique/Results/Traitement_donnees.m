% 
[Valeurs Texte ValeursEtTexte] = xlsread('Bump.xlsx');
Bump = Valeurs(:,1);
Steering_Angle_Right = Valeurs(:,2);
Steering_Angle_Left = Valeurs(:,3);
Rear_Toe = Valeurs(:,4);
Front_Wheel_Travel = abs(Valeurs(:,5)-Valeurs(28,5));
Rear_Wheel_Travel = abs(Valeurs(:,6)-Valeurs(28,6));
Front_Suspension_Travel = abs(Valeurs(:,7)-Valeurs(28,7));
Rear_Suspension_Travel = abs(Valeurs(:,8)-Valeurs(28,8));
Front_Camber = Valeurs(:,9);
Rear_Camber = Valeurs(:,10);
Front_CIRy = Valeurs(:,11);
Front_CIRz = Valeurs(:,12);
Rear_CIRy = Valeurs(:,13);
Rear_CIRz = Valeurs(:,14);


Front_MR = Front_Wheel_Travel./Front_Suspension_Travel;

for i=2:length(Front_MR)-1
    if isnan(Front_MR(i))
        Front_MR(i) = (Front_MR(i+1)+Front_MR(i-1))/2;
    end
end

Rear_MR = Rear_Wheel_Travel./Rear_Suspension_Travel;

for i=2:length(Rear_MR)-1
    if isnan(Rear_MR(i))
        Rear_MR(i) = (Rear_MR(i+1)+Rear_MR(i-1))/2;
    end
end

figure       
plot(-Bump, Front_MR,-Bump, Rear_MR)
title('Motion Ratio (Wheel/Suspension)')
xlabel('Bump (mm)')
ylabel('Motion ratio')
legend('Front', 'Rear')

figure
plot(-Bump, -Front_Camber, -Bump, -Rear_Camber)
title('Camber Variation')
xlabel('Bump (mm)')
ylabel('Camber (deg)')
legend('Front', 'Rear')

figure
plot(-Bump, Front_CIRz, -Bump, Rear_CIRz)
title('Roll Center Position to ground')
xlabel('Bump (mm)')
ylabel('Distance (mm)')
legend('Front', 'Rear')