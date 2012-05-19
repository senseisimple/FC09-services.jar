.class Lcom/android/server/NotificationManagerService$2;
.super Landroid/content/BroadcastReceiver;
.source "NotificationManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/NotificationManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/NotificationManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/NotificationManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 449
    iput-object p1, p0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 29
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 452
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    .line 453
    .local v5, action:Ljava/lang/String;
    const-string v22, "NotificationService"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "notification manager receiver action = "

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    move-object v1, v5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 454
    const/16 v18, 0x0

    .line 456
    .local v18, queryRestart:Z
    const-string v22, "android.intent.action.BATTERY_CHANGED"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_135

    .line 457
    const-string v22, "plugged"

    const/16 v23, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v22

    if-eqz v22, :cond_11d

    const/16 v22, 0x1

    move/from16 v8, v22

    .line 458
    .local v8, batteryCharging:Z
    :goto_40
    const-string v22, "level"

    const/16 v23, -0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v15

    .line 459
    .local v15, level:I
    if-ltz v15, :cond_123

    const/16 v22, 0xa

    move v0, v15

    move/from16 v1, v22

    if-gt v0, v1, :cond_123

    const/16 v22, 0x1

    move/from16 v11, v22

    .line 460
    .local v11, batteryLow:Z
    :goto_5b
    const-string v22, "status"

    const/16 v23, 0x1

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    move/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v19

    .line 461
    .local v19, status:I
    const/16 v22, 0x3

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_129

    const/16 v22, 0x1

    move/from16 v9, v22

    .line 462
    .local v9, batteryDischarging:Z
    :goto_75
    const/16 v22, 0x5

    move/from16 v0, v19

    move/from16 v1, v22

    if-ne v0, v1, :cond_12f

    const/16 v22, 0x1

    move/from16 v10, v22

    .line 464
    .local v10, batteryFull:Z
    :goto_81
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mBatteryCharging:Z
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1100(Lcom/android/server/NotificationManagerService;)Z

    move-result v22

    move v0, v8

    move/from16 v1, v22

    if-ne v0, v1, :cond_bd

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mBatteryDischarging:Z
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1200(Lcom/android/server/NotificationManagerService;)Z

    move-result v22

    move v0, v9

    move/from16 v1, v22

    if-ne v0, v1, :cond_bd

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mBatteryLow:Z
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1300(Lcom/android/server/NotificationManagerService;)Z

    move-result v22

    move v0, v11

    move/from16 v1, v22

    if-ne v0, v1, :cond_bd

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #getter for: Lcom/android/server/NotificationManagerService;->mBatteryFull:Z
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1400(Lcom/android/server/NotificationManagerService;)Z

    move-result v22

    move v0, v10

    move/from16 v1, v22

    if-eq v0, v1, :cond_f6

    .line 468
    :cond_bd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v8

    #setter for: Lcom/android/server/NotificationManagerService;->mBatteryCharging:Z
    invoke-static {v0, v1}, Lcom/android/server/NotificationManagerService;->access$1102(Lcom/android/server/NotificationManagerService;Z)Z

    .line 469
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v9

    #setter for: Lcom/android/server/NotificationManagerService;->mBatteryDischarging:Z
    invoke-static {v0, v1}, Lcom/android/server/NotificationManagerService;->access$1202(Lcom/android/server/NotificationManagerService;Z)Z

    .line 470
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v11

    #setter for: Lcom/android/server/NotificationManagerService;->mBatteryLow:Z
    invoke-static {v0, v1}, Lcom/android/server/NotificationManagerService;->access$1302(Lcom/android/server/NotificationManagerService;Z)Z

    .line 471
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    move-object/from16 v0, v22

    move v1, v10

    #setter for: Lcom/android/server/NotificationManagerService;->mBatteryFull:Z
    invoke-static {v0, v1}, Lcom/android/server/NotificationManagerService;->access$1402(Lcom/android/server/NotificationManagerService;Z)Z

    .line 472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateLights()V
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1500(Lcom/android/server/NotificationManagerService;)V

    .line 475
    :cond_f6
    sget-object v22, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    const-string v23, "SPH-D700"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_11c

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->checkHasNumber()Z
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1600(Lcom/android/server/NotificationManagerService;)Z

    move-result v22

    if-nez v22, :cond_11c

    .line 476
    const-string v22, "NotificationService"

    const-string v23, "start checkAndBroadCastWIMAXCableState"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->checkAndBroadCastWIMAXCableState()V
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$1700(Lcom/android/server/NotificationManagerService;)V

    .line 527
    .end local v8           #batteryCharging:Z
    .end local v9           #batteryDischarging:Z
    .end local v10           #batteryFull:Z
    .end local v11           #batteryLow:Z
    .end local v15           #level:I
    .end local v19           #status:I
    :cond_11c
    :goto_11c
    return-void

    .line 457
    :cond_11d
    const/16 v22, 0x0

    move/from16 v8, v22

    goto/16 :goto_40

    .line 459
    .restart local v8       #batteryCharging:Z
    .restart local v15       #level:I
    :cond_123
    const/16 v22, 0x0

    move/from16 v11, v22

    goto/16 :goto_5b

    .line 461
    .restart local v11       #batteryLow:Z
    .restart local v19       #status:I
    :cond_129
    const/16 v22, 0x0

    move/from16 v9, v22

    goto/16 :goto_75

    .line 462
    .restart local v9       #batteryDischarging:Z
    :cond_12f
    const/16 v22, 0x0

    move/from16 v10, v22

    goto/16 :goto_81

    .line 481
    .end local v8           #batteryCharging:Z
    .end local v9           #batteryDischarging:Z
    .end local v11           #batteryLow:Z
    .end local v15           #level:I
    .end local v19           #status:I
    :cond_135
    const-string v22, "android.intent.action.BOOT_COMPLETED"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_153

    .line 482
    const-string v22, "NotificationService"

    const-string v23, "Received ACTION_BOOT_COMPLETED"

    invoke-static/range {v22 .. v23}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 483
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    #setter for: Lcom/android/server/NotificationManagerService;->mBootCompleted:Z
    invoke-static/range {v22 .. v23}, Lcom/android/server/NotificationManagerService;->access$1802(Lcom/android/server/NotificationManagerService;Z)Z

    goto :goto_11c

    .line 486
    :cond_153
    const-string v22, "android.hardware.usb.action.USB_STATE"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_18d

    .line 487
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v12

    .line 488
    .local v12, extras:Landroid/os/Bundle;
    const-string v22, "connected"

    move-object v0, v12

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v21

    .line 489
    .local v21, usbConnected:Z
    const-string v22, "enabled"

    const-string v23, "adb"

    move-object v0, v12

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 491
    .local v6, adbEnabled:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    if-eqz v21, :cond_18a

    if-eqz v6, :cond_18a

    const/16 v23, 0x1

    :goto_186
    #calls: Lcom/android/server/NotificationManagerService;->updateAdbNotification(Z)V
    invoke-static/range {v22 .. v23}, Lcom/android/server/NotificationManagerService;->access$1900(Lcom/android/server/NotificationManagerService;Z)V

    goto :goto_11c

    :cond_18a
    const/16 v23, 0x0

    goto :goto_186

    .line 492
    .end local v6           #adbEnabled:Z
    .end local v12           #extras:Landroid/os/Bundle;
    .end local v21           #usbConnected:Z
    :cond_18d
    const-string v22, "android.intent.action.PACKAGE_REMOVED"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_1b9

    const-string v22, "android.intent.action.PACKAGE_RESTARTED"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-nez v22, :cond_1b9

    const-string v22, "android.intent.action.QUERY_PACKAGE_RESTART"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-nez v18, :cond_1b9

    const-string v22, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_228

    .line 496
    :cond_1b9
    const/16 v16, 0x0

    .line 497
    .local v16, pkgList:[Ljava/lang/String;
    const-string v22, "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_1ff

    .line 498
    const-string v22, "android.intent.extra.changed_package_list"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    .line 512
    :goto_1d0
    if-eqz v16, :cond_11c

    move-object/from16 v0, v16

    array-length v0, v0

    move/from16 v22, v0

    if-lez v22, :cond_11c

    .line 513
    move-object/from16 v7, v16

    .local v7, arr$:[Ljava/lang/String;
    array-length v14, v7

    .local v14, len$:I
    const/4 v13, 0x0

    .local v13, i$:I
    :goto_1dd
    if-ge v13, v14, :cond_11c

    aget-object v17, v7, v13

    .line 514
    .local v17, pkgName:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    const/16 v24, 0x0

    if-nez v18, :cond_225

    const/16 v25, 0x1

    :goto_1ef
    move-object/from16 v0, v22

    move-object/from16 v1, v17

    move/from16 v2, v23

    move/from16 v3, v24

    move/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/server/NotificationManagerService;->cancelAllNotificationsInt(Ljava/lang/String;IIZ)Z

    .line 513
    add-int/lit8 v13, v13, 0x1

    goto :goto_1dd

    .line 499
    .end local v7           #arr$:[Ljava/lang/String;
    .end local v13           #i$:I
    .end local v14           #len$:I
    .end local v17           #pkgName:Ljava/lang/String;
    :cond_1ff
    if-eqz v18, :cond_20c

    .line 500
    const-string v22, "android.intent.extra.PACKAGES"

    move-object/from16 v0, p2

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v16

    goto :goto_1d0

    .line 502
    :cond_20c
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v20

    .line 503
    .local v20, uri:Landroid/net/Uri;
    if-eqz v20, :cond_11c

    .line 506
    invoke-virtual/range {v20 .. v20}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v17

    .line 507
    .restart local v17       #pkgName:Ljava/lang/String;
    if-eqz v17, :cond_11c

    .line 510
    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v16, v0

    .end local v16           #pkgList:[Ljava/lang/String;
    const/16 v22, 0x0

    aput-object v17, v16, v22

    .restart local v16       #pkgList:[Ljava/lang/String;
    goto :goto_1d0

    .line 514
    .end local v20           #uri:Landroid/net/Uri;
    .restart local v7       #arr$:[Ljava/lang/String;
    .restart local v13       #i$:I
    .restart local v14       #len$:I
    :cond_225
    const/16 v25, 0x0

    goto :goto_1ef

    .line 517
    .end local v7           #arr$:[Ljava/lang/String;
    .end local v13           #i$:I
    .end local v14           #len$:I
    .end local v16           #pkgList:[Ljava/lang/String;
    .end local v17           #pkgName:Ljava/lang/String;
    :cond_228
    const-string v22, "android.intent.action.SCREEN_ON"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_249

    .line 518
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    const/16 v23, 0x1

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v22 .. v23}, Lcom/android/server/NotificationManagerService;->access$2002(Lcom/android/server/NotificationManagerService;Z)Z

    .line 519
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$2100(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_11c

    .line 520
    :cond_249
    const-string v22, "android.intent.action.SCREEN_OFF"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_26a

    .line 521
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    #setter for: Lcom/android/server/NotificationManagerService;->mScreenOn:Z
    invoke-static/range {v22 .. v23}, Lcom/android/server/NotificationManagerService;->access$2002(Lcom/android/server/NotificationManagerService;Z)Z

    .line 522
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$2100(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_11c

    .line 523
    :cond_26a
    const-string v22, "android.intent.action.PHONE_STATE"

    move-object v0, v5

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22

    if-eqz v22, :cond_11c

    .line 524
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    const-string v23, "state"

    move-object/from16 v0, p2

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v23

    sget-object v24, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual/range {v23 .. v24}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v23

    #setter for: Lcom/android/server/NotificationManagerService;->mInCall:Z
    invoke-static/range {v22 .. v23}, Lcom/android/server/NotificationManagerService;->access$2202(Lcom/android/server/NotificationManagerService;Z)Z

    .line 525
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/NotificationManagerService$2;->this$0:Lcom/android/server/NotificationManagerService;

    move-object/from16 v22, v0

    #calls: Lcom/android/server/NotificationManagerService;->updateNotificationPulse()V
    invoke-static/range {v22 .. v22}, Lcom/android/server/NotificationManagerService;->access$2100(Lcom/android/server/NotificationManagerService;)V

    goto/16 :goto_11c
.end method
