#ifndef WEBAPPCONTROLLER_H
#define WEBAPPCONTROLLER_H

#include <QObject>
#include <QNetworkAccessManager>

class WebAppController: public QObject {
    Q_OBJECT
    QNetworkAccessManager manager;
public:
    explicit WebAppController(QObject *parent = nullptr);
public slots:
    void getPageInfo();
    void auth(QString token);
private slots:
    void slotPageInfo(QNetworkReply* reply);
    void onFriends(QNetworkReply* reply);
signals:
    void signalOut(QString value);
    void cppFriends(QString data);
};

#endif // WEBAPPCONTROLLER_H
