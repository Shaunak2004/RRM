clear;
% img = double(imread('9.bmp'));
% 
% para.epsilon_stop_L = 1e-3;
% para.epsilon_stop_R = 1e-3;
% para.epsilon = 10/255;
% para.u = 1;
% para.ro = 1.5;
% para.lambda = 5;
% para.beta = 0.01;
% para.omega = 0.01;
% para.delta = 10;
% 
% gamma = 2.2;
% 
% [R, L, N] = lowlight_enhancement(img, para);
% 
% res = R.*L.^(1/gamma);
% 
% figure,imshow(res)


fpath = 'C:\Users\user\Desktop\LowLight\GT\'
files = {'LOLTest'};
for tfn=1:length(files)
    imgs = dir(strcat(fpath, string(files(tfn)), '\low\', '*.png'));
    for k=1:length(imgs)
        I = double(imread(strcat(fpath, string(files(tfn)), '\low\', imgs(k).name)));
        para.epsilon_stop_L = 1e-3;
        para.epsilon_stop_R = 1e-3;
        para.epsilon = 10/255;
        para.u = 1;
        para.ro = 1.5;
        para.lambda = 5;
        para.beta = 0.01;
        para.omega = 0.01;
        para.delta = 10;

        gamma = 2.2;

        [R, L, N] = lowlight_enhancement(I, para);

        J = R.*L.^(1/gamma);
        J = im2uint8(J);

        filename = strcat('C:\Users\user\Desktop\LowLight\OtherResults\RRM\', string(files(tfn)));
        if ~exist(filename,'dir')
            mkdir(filename);
        end
        if strcmp(string(files(tfn)), 'DRBNtest')
            saveimg = strcat(filename, '\normal', imgs(k).name(4:end));
        else
            saveimg = strcat(filename, '\', imgs(k).name);
        end
        imwrite(J, saveimg);
    end
end



















