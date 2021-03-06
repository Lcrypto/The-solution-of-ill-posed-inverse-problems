%  Nonsatur

% ��������� �������� ������� ������� (� ������������ �����) � ������ ���
% ��������� (������������ ������ ������������� ��������). ������������:
% 1) ������� ����� ��������; 2) ������������� ����� �������� (m=2);
% 3) ����� ������������; 4) ����������� ����� ������������� ��������
% ���������� ������� ��� ��������� �������������, ���������� �� ��� � 
% ������������ ��������� � L_2 (�.210). 
%   

clear all;close all

global meth

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FntNm='Arial Cyr';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

srrr=char(['������� ����� ��������' 
          '������. ����� ��������' 
          '  ����� ������������  ' 
          '  ����� ��� ��������� ']);
disp(' ');      
disp('  ��������� �������� ������� ������� (� ������������ �����) � ������ ���');
disp('  ��������� (������������ ������ ������������� ��������). ������������:');
disp('  1) ������� ����� ��������; 2) ������������� ����� �������� (m=2);');
disp('  3) ����� ������������; 4) ����������� ����� ������������� ��������');
disp('  ���������� ������� ��� ��������� �������������, ���������� �� ��� � ');
disp('  ������������ ��������� � L_2 (�.210).      ');
disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ');
disp('    ��� ������ ���������� ������� ����!');pause
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ');

% �����
N=121;
s=linspace(0,1,N);ht=s(2)-s(1);n=length(s);%x=t;hx=ht;
x=linspace(0,1,N);hx=x(2)-x(1);m=length(x);
[TT,XX]=meshgrid(s,x);
K0=XX.*(1-TT);DD=diag(diag(K0));D1=triu(K0);K1=D1+D1'-DD;

%  ��������� ������:
z=sin(4*pi*s');
u0=z/16/pi/pi;
AA=K1*ht;AA(:,1)=0.5*AA(:,1);AA(:,end)=0.5*AA(:,end);

%  ���������� ������:
delta=0.1;
C=1.1;ster=1;
RN1=randn(size(u0));
RK1=(randn(size(AA)));
if ster==1;load Error_Comp;end
u=u0+delta*norm(u0)*RN1/norm(RN1);hdelta=0.0001;
A=AA+hdelta*norm(AA)*RK1/norm(RK1);

figure(41);plot(x,u0,'r',x,u,'.');set(gca,'FontName',FntNm);
xlabel('x');title(' ������ � ������������ ������')
set(gcf,'Name','������ � ������������ ������','NumberTitle','off');pause(1)

disp(' ');disp(['          ������� ������ ������ �����: delta = ' num2str(100*delta) '% ']);
disp(' ');disp('   ����������� ����� ��������� �������� �� ����������� ������ ������� � L_2');
disp(' ');
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ');
reg=0;

[IL,U,V,sig,X,y,w,sss]=L_reg_0(reg,A,u,hx,ht);

q=0.5;NN=40;% ����� �� alpha 

for me=1:4;meth=me;
  disp(' ');disp(['     ������������: ' srrr(meth,:) ' (' num2str(meth) ')']);
  [alf_opn]=gen_PN(s,A,u,U,V,sig,IL,X,y,w,delta,hdelta,C,q,NN,z);end

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ����� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ');



