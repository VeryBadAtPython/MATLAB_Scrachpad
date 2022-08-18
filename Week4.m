Results = readtable('Week4.csv');
Results = Results{:,:};

distances = Results(:,1);
fieldVals = Results(:,2);
XPOS1 = Results(:,3);
YPOS1 = Results(:,4);

B1 = zeros(length(distances),0);
B2 = zeros(length(distances),0);
for i = 1:1:length(distances)
    B1(i)=model1(distances(i));
    B2(i)=model2(distances(i));
end

residuals1 = fieldVals - transpose(B1);
chisqr1 = chiSquaredCal(fieldVals,B1,YPOS1)

residuals2 = fieldVals - transpose(B2);
chisqr2 = chiSquaredCal(fieldVals,B2,YPOS1)

tiledlayout('Flow');

nexttile;
errorbar(distances,fieldVals,YPOS1,YPOS1,XPOS1,XPOS1,'o');
hold on;
plot(distances,B1);
xlabel('d (m)');
ylabel('B (T)');
title('Model 1');

nexttile;
errorbar(distances,residuals1,YPOS,YPOS,XPOS,XPOS,'o');
hold on;
plot(distances,zeros(length(distances),1))
xlabel('d (m)');
ylabel('Residual in B (T)');
title('Model 1 Residuals');

nexttile;
errorbar(distances,fieldVals,YPOS1,YPOS1,XPOS1,XPOS1,'o');
hold on;
plot(distances,B2);
xlabel('d (m)');
ylabel('B (T)');
title('Model 2');

nexttile;
errorbar(distances,residuals2,YPOS,YPOS,XPOS,XPOS,'o');
hold on;
plot(distances,zeros(length(distances),1))
xlabel('d (m)');
ylabel('Residual in B (T)');
title('Model 2 Residuals');

function [B] = model1(d)
    mu0 = 4*pi*1E-7;
    I = 2;
    N = 700;
    L = 0.149;
    R = 0.024;
    B = (mu0/(4*pi))*(2*pi*I*N/L)*( (d+0.5*L)/sqrt((d+0.5*L)^2+R^2) - (d-0.5*L)/sqrt((d-0.5*L)^2+R^2) );
end

function [B] = model2(d)
    mu0 = 4*pi*1E-7;
    I = 2;
    N = 700;
    L = 0.149;
    R = 0.0205;
    B = (mu0/(4*pi))*(2*pi*I*N/L)*( (d+0.5*L)/sqrt((d+0.5*L)^2+R^2) - (d-0.5*L)/sqrt((d-0.5*L)^2+R^2) );
end

function [chisqr] = chiSquaredCal(vals,model,yuncert)
    chi = 0;
    for i = 1:1:length(vals);
        chi = chi + ((vals(i)-model(i))/yuncert(i))^2;
    end
    chisqr = chi/4;
end



