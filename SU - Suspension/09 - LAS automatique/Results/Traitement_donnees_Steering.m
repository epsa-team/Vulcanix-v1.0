% 
[Valeurs Texte ValeursEtTexte] = xlsread('Steering.xlsx');
Steering = Valeurs(:,1);
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

figure
plot(Steering, -Front_Camber, Steering, -Rear_Camber)
title('Camber Variation')
xlabel('Steering (mm)')
ylabel('Camber (deg)')
legend('Front', 'Rear')

figure
plot(Steering_Angle_Right, Steering_Angle_Left, [-30,30],[-30,30])
title('Angle comparison between Wheel')
xlabel('Right Wheel (°)')
ylabel('Left Wheel (°)')