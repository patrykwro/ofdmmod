%wchodz� nam dane rzeczywiste szeregowo
8888

N=4;
fs=16;

%liczymy fft porcjami po step punkt�w

step=fs*N;

for i=1:length(data_in)/N
    data_demodulated((i-1)*step+1:(i-1)*step+step)=fft(data_serialized((i-1)*step+1:(i-1)*step+step));
end

% serial to parallel
for i=1:fs*length(data_in)/N
    for j=1:N
        data_demodulated_parallel(j,i)=data_demodulated((i-1)*N+j);       
    end
end

%demapping
%bierzemy kolejne 16 symboli z ka�dego oczepu sumujemy je i jeszcze raz
%liczymy jeddno punktow� fft
%nie ma to �adnego uzasadnienia naukowego
for i=i:length(data_in)/N
    for j=1:N
        data_demapped(j,i)=data_demodulated_parallel(
    end
end

%demodulacja, ka�de 16 pr�bek powinno teraz zosta� potraktowane jako symbol
%i zdekodowane jako 1 lub 0




%figure(5)
%hold on;
%plot(real(data_demodulated),'r');
%plot(imag(data_demodulated),'b');