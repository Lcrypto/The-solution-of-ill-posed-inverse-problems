function K=yadro(X,H,R,phi)
% ���� ������������� ���������
K =(1./2.*log(X.^2+H.^2+R.^2-2.*X.*R.*cos(phi)+2.*H.*R.*sin(phi)).*H.*(2.*X.^2+...
  2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2).*cos(2.*phi)+2.*atan(2.*(X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*X.*H.*cos(3.*phi)-1./2.*log(X.^2+...
  H.^2).*X.*(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2).*sin(2.*phi)+atan(2.*(-R+X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*sin(phi).*X.^2-atan(2.*(X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*H.^2.*sin(3.*phi)-atan(2.*(X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*H.^2.*sin(phi)-1./2.*log(X.^2+H.^2).*H.*(2.*X.^2+...
  2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2).*cos(2.*phi)+atan(2.*(-R+X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*H.^2.*sin(3.*phi)+atan(2.*(X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*X.^2.*sin(3.*phi)-atan(2.*(X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*sin(phi).*X.^2-atan(2.*(-R+X.*cos(phi)-...
  H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2)).*X.^2.*sin(3.*phi)+R.*sin(phi).*(2.*X.^2+...
  2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+2.*H.^2.*cos(2.*phi)).^(1./2)+...
  atan(2.*(-R+X.*cos(phi)-H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+...
  4.*X.*H.*sin(2.*phi)+2.*H.^2.*cos(2.*phi)).^(1./2)).*H.^2.*sin(phi)-...
  2.*atan(2.*(-R+X.*cos(phi)-H.*sin(phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+...
  4.*X.*H.*sin(2.*phi)+2.*H.^2.*cos(2.*phi)).^(1./2)).*X.*H.*cos(3.*phi)+...
  1./2.*log(X.^2+H.^2+R.^2-2.*X.*R.*cos(phi)+2.*H.*R.*sin(phi)).*X.*(2.*X.^2+...
  2.*H.^2-2.*X.^2.*cos(2.*phi)+4.*X.*H.*sin(2.*phi)+...
  2.*H.^2.*cos(2.*phi)).^(1./2).*sin(2.*phi))./(2.*X.^2+2.*H.^2-2.*X.^2.*cos(2.*phi)+...
  4.*X.*H.*sin(2.*phi)+2.*H.^2.*cos(2.*phi)).^(1./2);
