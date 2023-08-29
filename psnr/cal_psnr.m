% 指定文件夹路径
blur_path = 'D:\\去模糊结果\\Schmit-text\\blur';
gt_path = 'D:\\去模糊结果\\Schmit-text\\gt';
% 获取文件夹中的所有文件名
files_blur = dir(fullfile(blur_path, '*.png'));
files_gt = dir(fullfile(gt_path, '*.png'));
% 循环读取每张图片，并显示
psnr = 0.0;
ssim = 0.0;
disp(length(files_blur))
for i = 1:length(files_blur)
    % 读取图片
    img_name = files_blur(i).name;
    
    img_path = fullfile(blur_path, img_name);
    gt_path_ = fullfile(gt_path, img_name);
    disp(img_path)
    img = im2double(imread(img_path));
    gt_img = im2double(imread(gt_path_));
    % 显示图片
    [psnrs,ssims,tI1] = comp_upto_shift(gt_img, img, 1);
    psnr = psnr + psnrs;
    ssim = ssim + ssims;
    disp(psnrs);
    disp(ssims);

end
disp(psnr / length(files_blur));
disp(ssim / length(files_blur));