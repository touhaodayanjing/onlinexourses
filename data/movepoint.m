
%% ����
x = [-2,-1.5,-1,-0.5,0,0.5,1.0,1.5,2]';
y = power(x,2);
P = [x,y];

MouseControl(figure(1),P);


function MouseControl(gcf, P)
	mouseSign = 0;  %��������־��1���� 0û��
	%��ʼ��ͼ����ʾ
	Pscatter_fig = scatter(P(:,1), P(:,2), 'b*'); 
	hold on
	Pplot_fig = plot(P(:,1), P(:,2), 'g');
    hold off
	%�ص�
	set(gcf,'WindowButtonMotionFcn',@ButtonMotionFcn,'WindowButtonDownFcn',@ButttonDownFcn,'WindowButtonUpFcn',@ButttonUpFcn);

    %����ƶ�
    function ButtonMotionFcn(~,~)
        set(gcf,'Pointer','hand'); % ����Ϊ�ֵ���״
        if mouseSign == 1
            %���ص�ǰ���������λ��
            mousePoint = get(gca,'CurrentPoint');
            mousePonit_x = mousePoint(1,1);
            mousePonit_y = mousePoint(1,2);
            
            %���ڼ�������Ƶ�����
            dis = [];
            for i = 1:size(P,1)
                dis(i,1) = sqrt((P(i,1)-mousePonit_x)^2 + (P(i,2)-mousePonit_y)^2);
            end
            %��갴�µĵ���������ĳһ��ľ�������������ѡ���˸ĵ�
            [val, row] = min(dis);

            %������ֵ��С����Ϊѡ�иõ�
            if val<=1
                P(row,1) = mousePonit_x;
                P(row,2) = mousePonit_y;
                %ȥ����ͼ�� Ҳ����clf
                delete(Pscatter_fig)
                delete(Pplot_fig)

                %������ͼ��
                Pscatter_fig = scatter(P(:,1), P(:,2), 'b*');
                hold on
                Pplot_fig = plot(P(:,1), P(:,2), 'g');
                hold off
            end
        end
    end

    %��갴��
    function ButttonDownFcn(~,~)
        switch(get(gcf,'SelectionType'))
            case 'normal'
                mouseSign = 1;
            otherwise
        end
        disp(str);
    end

    %����ͷ�
    function ButttonUpFcn(~,~)
        mouseSign = 0;
        disp('����ͷ�')
    end
end 

