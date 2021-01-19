#!/bin/sh
#@shylocks�ֿ�ű�
function initShylocks() {
    git clone https://github.com/shylocks/Loon.git /shylocks
    npm install
}

 if [ ! -d "/shylocks/" ]; then
    echo "δ��鵽shylocks�ֿ�ű�����ʼ��������ؽű�"
    initShylocks
else
    echo "����shylocks�ű�����ļ�"
    git -C /shylocks reset --hard
    git -C /shylocks pull --rebase
    npm install
fi

##���������ļ�
cp -f /shylocks/jd*.js /scripts/

##ʹ���Զ���shell���ز�����ִ����ױ
echo "10 8,9,10 * * * node /scripts/jd_mh.js |ts >> /scripts/logs/jd_mh.log 2>&1" >> /scripts/docker/merged_list_file.sh
##ʹ���Զ���shell���ز�����ִ�б���������
echo "1 8,9 14-31/1 1 * node /scripts/jd_bj.js |ts >> /scripts/logs/jd_bj.log 2>&1" >> /scripts/docker/merged_list_file.sh
##ʹ���Զ���shell���ز�����ִ�о�����˿ר��
echo "1 7 * * * node /scripts/jd_wechat_sign.js |ts >> /scripts/logs/jd_wechat_sign.log 2>&1" >> /scripts/docker/merged_list_file.sh
##ʹ���Զ���shell���ز�����ִ�о�����˿ר��
echo "1 7 * * * node /scripts/jd_ms.js |ts >> /scripts/logs/jd_ms.log 2>&1" >> /scripts/docker/merged_list_file.sh
#��ȯ����
echo "1 7 13 1 * node /scripts/jd_super_coupon.js |ts >> /scripts/logs/jd_super_coupon.log 2>&1" >> /scripts/docker/merged_list_file.sh
#��ҵ������
echo "30 * * * * node /scripts/jd_gyec.js |ts >> /scripts/logs/jd_gyec.log 2>&1" >> /scripts/docker/merged_list_file.sh
#С������
echo "5 7 * * * node /scripts/jd_xg.js |ts >> /scripts/logs/jd_xg.log 2>&1" >> /scripts/docker/merged_list_file.sh

# #��ʱ���Ӻ����
echo "58,59 18-20/1 * * * git -C /shylocks reset --hard && git -C /shylocks pull --rebase" >> /scripts/docker/merged_list_file.sh
echo "0,1 19-21/1 * * * node /scripts/jd_live_redrain2.js |ts >> /scripts/logs/jd_live_redrain2.log 2>&1" >> /scripts/docker/merged_list_file.sh
