#pragma once

#ifndef CONNECTIONDIALOG_H
#define CONNECTIONDIALOG_H

#include "ui_connectiondialog.h"

#include <QtCore/QPropertyAnimation>
#include <QtGui/QGraphicsOpacityEffect>
#include <QtGui/QDialog>
#include <QtGui/QPainter>
#include <QtGui/QBitmap>

class ConnectionDialog: public QDialog, private Ui::ConnectionDialog
{
    Q_OBJECT

public:
    explicit ConnectionDialog(QWidget *parent = 0);
    virtual ~ConnectionDialog();

private:
    QString userName() const;
    QString password() const;

    void updateActions();

    QRegion getRegion() const ;
    void updateMask();

protected:
    void paintEvent(QPaintEvent* event);

Q_SIGNALS:
    void sendUserInformation(const QString &user, const QString &passwd);
    void setVisibleComponent(bool visible);

private Q_SLOTS:
    void slotExitApplication() { qApp->quit(); }
    void slotDataBaseConnect();

    void currentChanged()      { updateActions(); }
    void slotSuccessConnection();

private:
    Ui::ConnectionDialog *ui;
};

#endif // CONNECTIONDIALOG_H
