function [Alf,Opt,Dis,Nz,VV,Tf,Dz,Ur]=func_calc(A,u,hx,ht,hdelta,delta,C,q,NN,z,reg);
% ��� All_alfa

%alf0=delta*norm(A)/(norm(u)-delta);Del=delta;%Del=delta*norm(u*h);
alf0=10*C*delta*norm(A)/(1-C*delta);
Alf=[];Dis=[];Dz=[];Nz=[];nz=[];VV=[];Tf=[];Ur=[];Opt=[];
for kk=1:NN;alf=alf0*q.^(kk-1);
   [zz,dis,gam,psi,ur_psi,dz]=tikh_inv(A,u,hx,ht,hdelta,delta,alf,reg);
   Alf=[Alf alf];Dis=[Dis dis];% ������� 
   Opt=[Opt norm(zz-z)/norm(z)];% �������� ������������ ������
   Nz=[Nz sqrt(gam)];% ����� ����������
   %nz=[nz norm(zz)];
   Dz=[Dz dz];% dzeta
   VV=[VV psi];% Quasiopt
   tf=alf*gam+dis^2;
   Tf=[Tf tf];% ���. �-�
   Ur=[Ur ur_psi];% �������. ��������������. �����
end   
