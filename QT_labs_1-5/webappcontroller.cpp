#include "webappcontroller.h"
#include <QNetworkReply>



WebAppController::WebAppController(QObject *parent) : QObject(parent) {
}

void WebAppController::getPageInfo() {
    qDebug() << "getPageInfo called";
    connect(&manager, &QNetworkAccessManager::finished, this, &WebAppController::slotPageInfo);
    manager.get(QNetworkRequest(QUrl("http://cbr.ru/currency_base/daily/")));
}

void WebAppController::slotPageInfo(QNetworkReply* reply) {
    reply->deleteLater();
    QByteArray s = reply->readAll();
//    qDebug() << s;
    QByteArray f = "<td>\xD0\xA2\xD0\xB0\xD0\xB4\xD0\xB6\xD0\xB8\xD0\xBA\xD1\x81\xD0\xBA\xD0\xB8\xD1\x85 \xD1\x81\xD0\xBE\xD0\xBC\xD0\xBE\xD0\xBD\xD0\xB8</td>\r\n          <td>";

    int i = s.indexOf(f) + f.size();
    int i2 = s.indexOf('<', i);
    QString ss = s.mid(i, i2 - i);
    qDebug() << ss;
    emit signalOut(ss);
}
void WebAppController::auth(QString token) {
    QString params = "method=friends.get&app_id=784111&secure=1&session_key=" + token + "&ext=1";
    QStringList paramsList = params.split("&");
    paramsList.sort();
    QString sig = paramsList.join("");
    sig += "aadc14fddf6d09072430f43261ce8dca";
    sig = QString(QCryptographicHash::hash(sig.toUtf8(), QCryptographicHash::Md5).toHex());
    qDebug() << "token: " << token;
    connect(&manager, &QNetworkAccessManager::finished, this, &WebAppController::onFriends);
    manager.get(QNetworkRequest(QUrl("http://www.appsmail.ru/platform/api?" + params + "&sig=" + sig)));
}

void WebAppController::onFriends(QNetworkReply* reply) {
    reply->deleteLater();
    QByteArray s = reply->readAll();
    emit cppFriends(s);
    qDebug() << s;

}
