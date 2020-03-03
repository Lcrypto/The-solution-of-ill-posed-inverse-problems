%  Paleoterm

%      ������� ��������� �������� ������ ���������������� ������������ ������� (�.274)

clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FntNm='Arial Cyr';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp(' ');disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
disp(' ');
disp('   ������� ��������� �������� ������ ���������������� ������������ ������� (�.274)');
disp(' ');


lcurve=0;% ����� ��������� �� L-������ (��=1/���=0)
mod_er=0;% C���������� (0) ��� ������������ (1) ����������

%  ����������� ������ �� ������������
N=40;
%  ���������
ga2=6.25e-3;Ga_a=4.12e-3;Ga=0.33;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      ���������� � ������� �������� ������

% ������� (������) ����� ������� u_k � ������ ������ ������ 
% � ��������� ������� u_k: MU => A_uk
tend=2;
tlist=0.05:0.05:tend;% ���������������� �����
t=tlist;
ht=tlist(2)-tlist(1);
NN=length(tlist);% ����������� �� �������
x=linspace(-1,1,N);yy=linspace(0,1,N);y=linspace(0,1,N);
[XX,YY]=meshgrid(x,y);b=(6.25e-3+4.12e-3*YY.^2);

load basis1_2.mat A u_k du_k d2u_k info;
% ����� �� ���������� NN=41 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   ������ ��������� ������� MU � ������� (������) ��� ���� ������ ��������������� UU

MU=(-4+1.2*exp(-(2-t)/1).*cos(6*pi*sqrt(2-t)/2)).*exp(Ga);
DMU=(1.2*exp(-2+t).*cos(3*pi*(2-t).^(1/2))+...
   1.2*3/2*exp(-2+t).*sin(3*pi*(2-t).^(1/2))*pi/(2-t+eps).^(1/2))*exp(Ga);


load overdet2.mat UU % ���������������

disp(' ');disp('-----------------------------------------------------------------------');
disp(' ');
disp('     �������� ������ �������� ������ - �������������� ������� � ��������.');
disp(' ');
disp('-----------------------------------------------------------------------');
figure(1);plot((UU).*exp(-Ga*y.^2)+MU(1),yy,'.-');set(gca,'FontName',FntNm);% +MU(1)
title('������������� ������ � ��������');
xlabel('T^{o} C');ylabel('������������� ������ H/H_0 �������� ������')
set(gcf,'Name','������ �������� ������','NumberTitle','off')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  ������ ������ ������ ������� ���������������:
disp(' ');
disp('   ������ ������������������ ������� � �������� ������ � ������� �������.');
disp(' ');
disp('   ��� ����������� ������� ����� �������!');pause
disp(' ');disp('-----------------------------------------------------------------------');

c=pinv(A)*UU';
%c=A\UU';
z0=u_k*c;UUU=A*c;Residual=norm(UU'-UUU)/norm(UU); 
disp(['     �����. ������� ��������� (L_2) = ' num2str(Residual)]);disp(' ');
figure(11);subplot (1,2,2);
plot((UU).*exp(-Ga*y.^2)+MU(1),yy,'r',(UUU').*exp(-Ga*y.^2)+MU(1),yy,'b.');
set(gca,'FontName',FntNm);
title('������������� ������');xlabel('T^{o} C');ylabel('������������� ������ H/H_0')
legend ('��������' ,'�����������' , 3 ) ;
subplot (1,2,1);plot(t-2,z0,'.-',t-2,MU','r');set(gca,'FontName',FntNm);
title('������������������ ������� ������ \mu(t)');
xlabel('������������� ����� t/t_0');ylabel('\mu(t), ^{o}C')
legend ('Calc' ,'Exact' , 1 ) ;
set(gcf,'Name','������������������ �������','NumberTitle','off')
disp(' ');
disp('   ��� ����������� ������� ����� �������!');
disp(' ');pause;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  ������ ������ � ������������ ������� ������� �������������

U=UU';AA=A;delta=0.001;
disp('-----------------------------------------------------------------------');
disp(' ');
disp('   ������ �������� ������ � ������������ ������� ������� �������������');
disp(['   ������� ������������� ��������� ������ ������ delta=' num2str(delta)]);disp(' ');
disp('   ��� ����������� ������� ����� �������!');
disp(' ');pause;

RU=randn(size(U));
if mod_er==0;load mod_error001 RU;end
U=U+delta*norm(U)*RU/norm(RU);

tikh_teploterm

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  ������������� �������
UUc=A*zr30;
figure(23);subplot (1,2,2);
plot((UU).*exp(-Ga*y.^2)+MU(1),yy,'r',(UUc').*exp(-Ga*y.^2)+MU(1),yy,'b.');
set(gca,'FontName',FntNm);
title('������������� ������');xlabel('T^{o} C');ylabel('������������� ������ H/H_0')
legend ('��������' ,'�����������' , 3 ) ;
subplot (1,2,1);plot(t(2:end)-2,zr0(2:end), '.-',t(2:end)-2,z(2:end), 'r-');
set(gca,'FontName',FntNm);
title('���������������� ������� ������ \mu(t)');
xlabel('����� t/t_0');ylabel('\mu(t), ^{o}C')
legend ('Calc' ,'Exact',2) ;
set(gcf,'Name','���������������� �������','NumberTitle','off')