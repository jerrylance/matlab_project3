% Homework 3
% Synthesize images using white Gaussian input and 
% filters generated in homework 1 (disks of different types))
% Zeyu Liu
% 3/19/2019
function homework4

N = 256;
type = 1; % circular dist
%type = 2;
%type = 3;

R = 50;   % radius

%rs = 10; % row shift
%cs = 10; % column shift

for rs=5:10:45,
    for cs=5:10:45,
    
% 1. Generate a white Gaussian random field
w = randn(N);
imagesc(w);
colormap(gray(256));
%pause;

% 2. Apply FFT to the white Gaussian random field you generated in Part 1.
W = fft2(w);
imagesc(real(W));
%pause;

% 3a. Generate a filter in spatial domain
h = filter_gen(N, R, type);
image(h);
pause;

% 3b. Apply FFT to the filter h
H = fft2(h);
imagesc(abs(real(H)));
%pause;

% 3c. Apply circular shift to H
H1 = cir_shift(H, rs, cs);
imagesc(abs(real(H1)));
pause;

% 3d. Multiply H1 with W (feq. domain convolution)
X = H1.*W;   % * means cha chen .* means dian chen 
imagesc(real(X));
%pause;

% 4. Apply inverse-FFT to each of the image you obtained in Part 3
x = ifft2(X);
imagesc(real(x));
pause;
end;
end;
