% Circular Shift function
% Shift rs and cs in row and column directions, and
% rotate back inside image if it is outside of image after
% shift operation
% Zeyu Liu
% 4/2/2019
function g = cir_shift(h, rs, cs)

N = length(h(:,1));

for m=1:N,
    for n=1:N,
            if (m<=rs) m1 = m-rs+N;
            else m1 = m-rs;
            end;
            if (n<=cs) n1 = n-cs+N;
            else n1 = n-cs;
            end;
            g(m,n) = h(m1,n1);
    end;
end;