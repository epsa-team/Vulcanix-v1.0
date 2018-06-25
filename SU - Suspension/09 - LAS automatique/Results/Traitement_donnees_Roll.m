% 
[Valeurs Texte ValeursEtTexte] = xlsread('Roll.xlsx');
Roll = Valeurs(:,1)-180;
Steering_Angle_Right = Valeurs(:,2);
Steering_Angle_Left = Valeurs(:,3);
Rear_Toe = Valeurs(:,4);
Front_Wheel_Travel = abs(Valeurs(:,5)-Valeurs(8,5));
Rear_Wheel_Travel = abs(Valeurs(:,6)-Valeurs(8,6));
Front_Suspension_Travel = abs(Valeurs(:,7)-Valeurs(8,7));
Rear_Suspension_Travel = abs(Valeurs(:,8)-Valeurs(8,8));
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
plot(Roll, Front_MR,Roll, Rear_MR)
title('Motion Ratio (Wheel/Suspension)')
xlabel('Roll (°)')
ylabel('Motion ratio')
legend('Front', 'Rear')

figure
plot(Roll, -Front_Camber, Roll, -Rear_Camber)
title('Camber Variation')
xlabel('Roll (°)')
ylabel('Camber (deg)')
legend('Front', 'Rear')

figure
plot(Front_CIRy, Front_CIRz, Rear_CIRy, Rear_CIRz)
title('Roll Center Position to ground during Roll')
xlabel('Position y (mm)')
ylabel('Position z (mm)')
legend('Front', 'Rear')

figure
plot(Roll, Front_CIRz, Roll, Rear_CIRz)
title('Roll Center Position to ground during Roll')
xlabel('Roll (°)')
ylabel('Position z (mm)')
legend('Front', 'Rear')

figure
plot(Roll, Front_CIRy, Roll, Rear_CIRy)
title('Roll Center Position to ground during Roll')
xlabel('Roll (°)')
ylabel('Position y (mm)')
legend('Front', 'Rear')