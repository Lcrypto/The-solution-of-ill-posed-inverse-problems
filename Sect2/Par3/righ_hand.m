function [uu]=righ_hand(x,p);

uu=7./4.*(2.*(p+p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)-2.*p.*x+...
   2.*p).^(1./2)./p.^(1./2).*log(p.^(1./2)+(2.*(p.*(1+...
   p.*x.^2-2.*p.*x+p)).^(1./2)-2.*p.*x+2.*p).^(1./2)+(1+...
   p.*x.^2-2.*p.*x+p).^(1./2))-7./4.*(2.*(p+p.^2.*x.^2-...
   2.*p.^2.*x+p.^2).^(1./2)-2.*p.*x+2.*p).^(1./2).*x./p.^(1./2).*log(p.^(1./2)+...
   (2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)-2.*p.*x+2.*p).^(1./2)+...
   (1+p.*x.^2-2.*p.*x+p).^(1./2))-7./4.*(2.*(p+p.^2.*x.^2-2.*p.^2.*x+...
   p.^2).^(1./2)-2.*p.*x+2.*p).^(1./2)./p.^(3./2).*(p+p.^2.*x.^2-2.*p.^2.*x+...
   p.^2).^(1./2).*log(p.^(1./2)+(2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)-...
   2.*p.*x+2.*p).^(1./2)+(1+p.*x.^2-2.*p.*x+p).^(1./2))+7./4.*(2.*(p+...
   p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)-2.*p.*x+2.*p).^(1./2)./p.^(3./2).*(p+...
   p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2).*log(p.^(1./2)-(2.*(p.*(1+...
   p.*x.^2-2.*p.*x+p)).^(1./2)-2.*p.*x+2.*p).^(1./2)+(1+p.*x.^2-2.*p.*x+...
   p).^(1./2))-7./4.*(2.*(p+p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)-2.*p.*x+...
   2.*p).^(1./2)./p.^(1./2).*log(p.^(1./2)-(2.*(p.*(1+p.*x.^2-2.*p.*x+...
   p)).^(1./2)-2.*p.*x+2.*p).^(1./2)+(1+p.*x.^2-2.*p.*x+p).^(1./2))+...
   7./4.*(2.*(p+p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)-2.*p.*x+...
   2.*p).^(1./2).*x./p.^(1./2).*log(p.^(1./2)-(2.*(p.*(1+p.*x.^2-2.*p.*x+...
   p)).^(1./2)-2.*p.*x+2.*p).^(1./2)+(1+p.*x.^2-2.*p.*x+p).^(1./2))+...
   5./p.^(1./2).*atan(p.^(1./2).*x)+7./p.^(1./2)./(4.*(1+p.*x.^2-2.*p.*x+...
   p).^(1./2).*p.^(1./2)-2.*(p+p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)+2.*p.*x-...
   2.*p).^(1./2).*atan((2.*p.^(1./2)+(2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)-...
   2.*p.*x+2.*p).^(1./2))./(4.*(1+p.*x.^2-2.*p.*x+p).^(1./2).*p.^(1./2)-...
   2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)+2.*p.*x-2.*p).^(1./2))-...
   7./p.^(1./2)./(4.*(1+p.*x.^2-2.*p.*x+p).^(1./2).*p.^(1./2)-2.*(p+...
   p.^2.*x.^2-2.*p.^2.*x+p.^2).^(1./2)+2.*p.*x-2.*p).^(1./2).*atan((-2.*p.^(1./2)+...
   (2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)-2.*p.*x+2.*p).^(1./2))./(4.*(1+...
   p.*x.^2-2.*p.*x+p).^(1./2).*p.^(1./2)-2.*(p.*(1+p.*x.^2-2.*p.*x+p)).^(1./2)+...
   2.*p.*x-2.*p).^(1./2))-5.*atan(p.^(1./2).*(-2+x))./p.^(1./2);
%figure(2);plot(x,uu);
