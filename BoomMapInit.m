function BoomMapInit( BoomNum )
%boom��ͼ��ʼ�����������Ϊboom��
%   �˴���ʾ��ϸ˵��
global Mapsize BomPosition;
Mapsize=10;%��ͼ��С�����ܸı�

%��������boom��ͼ��ȫ��Ϊ0
for i=1:Mapsize
    for j=1:Mapsize
        BomPosition(i,j)=0;
    end
end

%�����������ģ�����λ��
for i=1:BoomNum
    BoomX(i)=randperm(Mapsize,1);
    BoomY(i)=randperm(Mapsize,1);
end

i=1;
%����Ƿ����ظ������BOOM���еĻ���������������
while i<=BoomNum
    for j=i+1:BoomNum
        if( BoomX(i)==BoomX(j) && BoomY(i)==BoomY(j) )
            BoomX(j)=randperm(Mapsize,1);
            BoomY(j)=randperm(Mapsize,1);
            i=0;     %���´�1��ʼ���
            break;
        end
    end
    i=i+1;
end

%������ȷ��boomλ�ã�������ֵΪ-1
for i=1:BoomNum
    BomPosition(BoomX(i),BoomY(i))=-1;
end

%ȷ��������Χ����ֵ
for i=1:Mapsize
    for j=1:Mapsize
        if(BomPosition(i,j)~=-1)
            %�����Χ������
            num=0;
            for m=i-1:i+1
                for n=j-1:j+1
                    if(m<=Mapsize && m>0 && n<=Mapsize && n>0)
                        if (BomPosition(m,n)==(-1))
                            num=num+1;
                        end
                    end
                end
            end
            BomPosition(i,j)=num;
        end
    end
end

end

