% 
[Valeurs Texte ValeursEtTexte] = xlsread('test_2.xls');
Rear_Suspension_Travel = Valeurs(:,5);
Rear_Wheel_Travel = Valeurs(:,6)-Valeurs(1,6);
Rear_MR = Rear_Wheel_Travel./Front_Suspension_Travel;

for i=2:length(Rear_MR)-1
    if isnan(Rear_MR(i))
        Rear_MR(i) = (Rear_MR(i+1)+Rear_MR(i-1))/2;
    end
end
        
plot(Rear_Suspension_Travel, Rear_MR)
title('Rear Motion Ratio (Wheel/Suspension)')
xlabel('Suspension Travel (mm)')
ylabel('Motion ratio')