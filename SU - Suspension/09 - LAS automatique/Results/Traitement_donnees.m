% 
[Valeurs Texte ValeursEtTexte] = xlsread('Bump_2.xlsx');
Bump = Valeurs(:,1);
Rear_Wheel_Travel = abs(Valeurs(:,5)-Valeurs(6,5));
Rear_Suspension_Travel = abs(Valeurs(:,7)-Valeurs(6,7));
Rear_MR = Rear_Wheel_Travel./Rear_Suspension_Travel;

for i=2:length(Rear_MR)-1
    if isnan(Rear_MR(i))
        Rear_MR(i) = (Rear_MR(i+1)+Rear_MR(i-1))/2;
    end
end
        
plot(Bump, Rear_MR)
title('Rear Motion Ratio (Wheel/Suspension)')
xlabel('Bump (mm)')
ylabel('Motion ratio')

Front_Camber = Valeurs(:,8);
Rear_Camber = Valeurs(:,9);


plot(-Bump, -Front_Camber)
title('Camber Variation')
xlabel('Bump (mm)')
ylabel('Camber (deg)')
legend('Front')