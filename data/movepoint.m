
%% 例子
x = [-2,-1.5,-1,-0.5,0,0.5,1.0,1.5,2]';
y = power(x,2);
P = [x,y];

MouseControl(figure(1),P);


function MouseControl(gcf, P)
	mouseSign = 0;  %鼠标左键标志，1按下 0没按
	%初始化图像显示
	Pscatter_fig = scatter(P(:,1), P(:,2), 'b*'); 
	hold on
	Pplot_fig = plot(P(:,1), P(:,2), 'g');
    hold off
	%回调
	set(gcf,'WindowButtonMotionFcn',@ButtonMotionFcn,'WindowButtonDownFcn',@ButttonDownFcn,'WindowButtonUpFcn',@ButttonUpFcn);

    %鼠标移动
    function ButtonMotionFcn(~,~)
        set(gcf,'Pointer','hand'); % 设置为手的形状
        if mouseSign == 1
            %返回当前窗口上鼠标位置
            mousePoint = get(gca,'CurrentPoint');
            mousePonit_x = mousePoint(1,1);
            mousePonit_y = mousePoint(1,2);
            
            %用于计算与控制点间距离
            dis = [];
            for i = 1:size(P,1)
                dis(i,1) = sqrt((P(i,1)-mousePonit_x)^2 + (P(i,2)-mousePonit_y)^2);
            end
            %鼠标按下的点与曲线上某一点的距离最近，则代表选择了改点
            [val, row] = min(dis);

            %距离阈值，小于认为选中该点
            if val<=1
                P(row,1) = mousePonit_x;
                P(row,2) = mousePonit_y;
                %去除旧图像 也可以clf
                delete(Pscatter_fig)
                delete(Pplot_fig)

                %更新新图像
                Pscatter_fig = scatter(P(:,1), P(:,2), 'b*');
                hold on
                Pplot_fig = plot(P(:,1), P(:,2), 'g');
                hold off
            end
        end
    end

    %鼠标按下
    function ButttonDownFcn(~,~)
        switch(get(gcf,'SelectionType'))
            case 'normal'
                mouseSign = 1;
            otherwise
        end
        disp(str);
    end

    %鼠标释放
    function ButttonUpFcn(~,~)
        mouseSign = 0;
        disp('鼠标释放')
    end
end 

