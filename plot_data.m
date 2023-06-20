clc;clear;
load('result\posterior, pancreatic 1.mat')
posterior1 = posterior;
post_pred_sim1 = post_pred_sim;
y1 = y;

load('result\posterior, pancreatic 2.mat')
posterior2 = posterior;
post_pred_sim2 = post_pred_sim;
y2 = y;

load('result\posterior, pancreatic 3.mat')
posterior3 = posterior;
post_pred_sim3 = post_pred_sim;
y3 = y;

load('result\posterior, pancreatic 4.mat')
posterior4 = posterior;
post_pred_sim4 = post_pred_sim;
y4 = y;

varName = {'p_0^1','g_{age}^1','\tau', 'p_0^2','g_{age}^2'};

%% plot pancreatic mouse 1
figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior1(:,1),'support',[0,1]);
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior1(:,6),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
title('p_{0}')
legend('Prior','Phase 1', 'Phase 2')
set(gca,'FontSize',20)

figure
yline(1/(length(y1)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior1(:,4),'support',[0,(length(y1)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior1(:,9),'support',[0,(length(y1)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,(length(y1)*24)])
title('g_{age}')
legend('Prior','Phase 1', 'Phase 2')
xlim([0,length(y1)*24])
set(gca,'FontSize',20)

figure
yline(1/length(y1),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior1(:,5));
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
legend('Prior','Posterior')
title('\tau')
set(gca,'FontSize',20)

figure
quant1_95CI = quantile(post_pred_sim1,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim1,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim1,[0.1 0.9]);
len1 = 1:length(y1);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior1(:,5));
plot(xi,f*10000,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y1),y1,'k','LineWidth',4);
legend('\tau','25% - 75%','10% - 90%','2.5% - 97.5%')
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y1)])
set(gca,'FontSize',20)

figure
gplotmatrix(posterior1(:, [1,4,5,6,9]));
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varName, 'FontSize',16);
text(repmat(-.1,1,5), [.86 .62 .41 .25 .02], varName, 'FontSize',16, 'Rotation',90);

%% plot pancreatic mouse 2
figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior2(:,1),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior2(:,6),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1/(length(y2)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior2(:,4),'support',[0,(length(y2)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior2(:,9),'support',[0,(length(y2)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,(length(y2)*24)])
title('g_{age}')
xlim([0,length(y2)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y2),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior2(:,5));
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
title('\tau')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim2,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim2,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim2,[0.1 0.9]);
len1 = 1:length(y2);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior2(:,5));
plot(xi,f*4000,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y2),y2,'k','LineWidth',4);
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y2)])
set(gca,'FontSize',22)

figure
gplotmatrix(posterior2(:, [1,4,5,6,9]));
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varName, 'FontSize',16);
text(repmat(-.1,1,5), [.86 .62 .41 .25 .02], varName, 'FontSize',16, 'Rotation',90);

%% plot pancreatic mouse 3
figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior3(:,1),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior3(:,6),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1/(length(y3)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior3(:,4),'support',[0,(length(y3)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior3(:,9),'support',[0,(length(y3)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,(length(y3)*24)])
title('g_{age}')
xlim([0,length(y3)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y3),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior3(:,5),'support',[0,33],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
title('\tau')
xlim([0,33])
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim3,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim3,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim3,[0.1 0.9]);
len1 = 1:length(y3);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior3(:,5),'support',[0,33],'BoundaryCorrection','reflection');
plot(xi,f*10000,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y3),y3,'k','LineWidth',4);
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y3)])
set(gca,'FontSize',22)

figure
gplotmatrix(posterior3(:, [1,4,5,6,9]));
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varName, 'FontSize',16);
text(repmat(-.1,1,5), [.86 .62 .41 .25 .02], varName, 'FontSize',16, 'Rotation',90);

%% plot pancreatic mouse 4
figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior4(:,1),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior4(:,6),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1/(length(y4)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior4(:,4),'support',[0,(length(y4)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior4(:,9),'support',[0,(length(y4)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,(length(y4)*24)])
title('g_{age}')
xlim([0,length(y4)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y4),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior4(:,5),'support',[0,33],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
title('\tau')
xlim([0,33])
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim4,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim4,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim4,[0.1 0.9]);
len1 = 1:length(y3);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior4(:,5),'support',[0,33],'BoundaryCorrection','reflection');
plot(xi,f*10000,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y4),y4,'k','LineWidth',4);
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y4)])
set(gca,'FontSize',22)

figure
gplotmatrix(posterior4(:, [1,4,5,6,9]));
text([.08 .24 .43 .66 .83], repmat(-.1,1,5), varName, 'FontSize',16);
text(repmat(-.1,1,5), [.86 .62 .41 .25 .02], varName, 'FontSize',16, 'Rotation',90);

%% plot other mouse data
clc;clear
% change to the dataset you want in result
load("result/posterior, breast mouse 3.mat")

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,1),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xlim([0,1])
legend('Prior','Posterior')
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,2),'support',[0,1],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xlim([0,1e-2])
title('p_{psc}')
set(gca,'FontSize',24)

figure
yline(1/50,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,3),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xlim([0,50])
title('d_{max}')
set(gca,'FontSize',24)

figure
yline(1/(length(y)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,4),'support',[0,(length(y)*2*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xlim([0,(length(y)*2*24)])
title('g_{age}')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim,[0.1 0.9]);
len1 = 1:length(y);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
hold on
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y),y,'k','LineWidth',4);
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y)])
set(gca,'FontSize',22)
legend('25% - 75%','10% - 90%','2.5% - 97.5%')
varName = {'p_0','p_{psc}', 'd_{max}','g_{age}'};
figure
gplotmatrix(posterior);
text([.08 .24 .43 .66 ], repmat(-.1,1,4), varName, 'FontSize',16);
text(repmat(-.1,1,4), [.62 .41 .25 .02], varName, 'FontSize',16, 'Rotation',90);

%% plot results for synthetic data
clc;clear;
load('result\posterior, syn1.mat')
load('syntheticDataset.mat')
param1 = param1;

figure
[f,xi] = ksdensity(posterior(:,1),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
hold on
[f1,xi1] = ksdensity(posterior(:,6),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
yline(1,'color',[33,113,181]/255,'LineWidth',3)
xlim([0,1])
legend('phase 1', 'phase 2')
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,2),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,7),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1e-3])
title('p_{psc}')
set(gca,'FontSize',24)

figure
yline(1/50,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,3),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,8),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,50])
title('d_{max}')
set(gca,'FontSize',24)

figure
yline(1/(length(y)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,4),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,9),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xline(param1(4),'color',[173,221,142]/255,'LineWidth',3)
xline(param1(9),'color',[2,129,138]/255,'LineWidth',3)
title('g_{age}')
xlim([0,length(y)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xline(param1(5),'color',[33,113,181]/255,'LineWidth',3)
title('\tau')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim,[0.1 0.9]);
len1 = 1:length(y);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,3000*f,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y),y,'k','LineWidth',4);
legend('\tau','25% - 75%','10% - 90%','2.5% - 97.5%')
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y)])
set(gca,'FontSize',20)

%%
clc;clear;
load('result\posterior, syn2.mat')
load('syntheticDataset.mat')
param1 = param2;

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,1),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,6),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
legend('phase 1', 'phase 2')
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,2),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,7),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1e-3])
title('p_{psc}')
set(gca,'FontSize',24)

figure
yline(1/50,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,3),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,8),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,50])
title('d_{max}')
set(gca,'FontSize',24)

figure
yline(1/(length(y)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,4),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,9),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xline(param1(4),'color',[173,221,142]/255,'LineWidth',3)
xline(param1(9),'color',[2,129,138]/255,'LineWidth',3)
title('g_{age}')
xlim([0,length(y)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xline(param1(5),'color',[33,113,181]/255,'LineWidth',3)
title('\tau')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim,[0.1 0.9]);
len1 = 1:length(y);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,10000*f,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y),y,'k','LineWidth',4);
legend('\tau','25% - 75%','10% - 90%','2.5% - 97.5%')
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y)])
set(gca,'FontSize',20)

%%
clc;clear;
load('result\posterior, syn3.mat')
load('syntheticDataset.mat')
param1 = param3;

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,1),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,6),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
legend('phase 1', 'phase 2')
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,2),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,7),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1e-3])
title('p_{psc}')
set(gca,'FontSize',24)

figure
yline(1/50,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,3),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,8),'support',[0,50],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,50])
title('d_{max}')
set(gca,'FontSize',24)

figure
yline(1/(length(y)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,4),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,9),'support',[0,(length(y)*24)],'BoundaryCorrection','reflection');
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xline(param1(4),'color',[173,221,142]/255,'LineWidth',3)
xline(param1(9),'color',[2,129,138]/255,'LineWidth',3)
title('g_{age}')
xlim([0,length(y)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
xline(param1(5),'color',[33,113,181]/255,'LineWidth',3)
title('\tau')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim,[0.1 0.9]);
len1 = 1:length(y);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
[f,xi] = ksdensity(posterior(:,5),'BoundaryCorrection','reflection');
plot(xi,20000*f,'color',[173,221,142]/255,'LineWidth',3);
hold on
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y),y,'k','LineWidth',4);
legend('\tau','25% - 75%','10% - 90%','2.5% - 97.5%')
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y)])
set(gca,'FontSize',20)

%%
clc;clear;
load('result/posterior, breast mouse 1.mat')
%load('syntheticDataset.mat')
%param = param3;

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,1),'support',[0,50]);
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,6),'support',[0,50]);
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1])
title('p_{0}')
set(gca,'FontSize',24)

figure
yline(1,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,2),'support',[0,50]);
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,7),'support',[0,50]);
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,1e-2])
title('p_{psc}')
set(gca,'FontSize',24)

figure
yline(1/50,'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,3),'support',[0,50]);
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,8),'support',[0,50]);
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
xlim([0,50])
title('d_{max}')
set(gca,'FontSize',24)

figure
yline(1/(length(y)*24),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,4),'support',[0,(length(y)*24)]);
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
[f1,xi1] = ksdensity(posterior(:,9),'support',[0,(length(y)*24)]);
plot(xi1,f1,'color',[2,129,138]/255,'LineWidth',3);
%xline(param(4),'color',[173,221,142]/255,'LineWidth',3)
%xline(param(9),'color',[2,129,138]/255,'LineWidth',3)
title('g_{age}')
xlim([0,length(y)*24])
set(gca,'FontSize',24)

figure
yline(1/length(y),'color',[33,113,181]/255,'LineWidth',3)
hold on
[f,xi] = ksdensity(posterior(:,5));
plot(xi,f,'color',[173,221,142]/255,'LineWidth',3);
%xline(param(5),'color',[33,113,181]/255,'LineWidth',3)
title('\tau')
set(gca,'FontSize',24)

figure
quant1_95CI = quantile(post_pred_sim,[0.025 0.975]);
quant1_75CI = quantile(post_pred_sim,[0.25 0.75]);
quant1_90CI = quantile(post_pred_sim,[0.1 0.9]);
len1 = 1:length(y);
cmap1 = [150,150,150;150,150,150;150,150,150]/255;
cmap2 = [107,174,214;107,174,214;107,174,214]/255;
cmap3 = [8,48,107;8,48,107;8,48,107]/255;
h175 = fill([len1, fliplr(len1)], [quant1_75CI(1,:), fliplr(quant1_75CI(2,:))],cmap3(1,:),'LineStyle','none');
hold on
h190 = fill([len1, fliplr(len1)], [quant1_90CI(1,:), fliplr(quant1_90CI(2,:))],cmap2(1,:),'LineStyle','none');
h195 = fill([len1, fliplr(len1)], [quant1_95CI(1,:), fliplr(quant1_95CI(2,:))],cmap1(1,:),'LineStyle','none');
set(h195,'facealpha',.4)
set(h190,'facealpha',.5)
set(h175,'facealpha',.8)
plot(1:length(y),y,'k','LineWidth',4);
xlabel('time (days)','fontsize',24)
ylabel('Tumour size','fontsize',24)
xlim([1,length(y)])
set(gca,'FontSize',24)

