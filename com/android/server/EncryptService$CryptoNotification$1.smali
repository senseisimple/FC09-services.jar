.class Lcom/android/server/EncryptService$CryptoNotification$1;
.super Ljava/lang/Object;
.source "EncryptService.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/EncryptService$CryptoNotification;->updateActiveNotification(ZZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/android/server/EncryptService$CryptoNotification;

.field final synthetic val$bCryptoPolicy:Z

.field final synthetic val$bFirstStorage:Z

.field final synthetic val$lv_percent:I


# direct methods
.method constructor <init>(Lcom/android/server/EncryptService$CryptoNotification;IZZ)V
    .registers 5
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 611
    iput-object p1, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iput p2, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$lv_percent:I

    iput-boolean p3, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bCryptoPolicy:Z

    iput-boolean p4, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bFirstStorage:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 15

    .prologue
    .line 614
    const/4 v4, 0x0

    .line 615
    .local v4, max:I
    const/4 v6, 0x0

    .line 616
    .local v6, progress:I
    const/4 v3, 0x0

    .line 617
    .local v3, id:I
    const/4 v1, 0x0

    .line 619
    .local v1, iRes:Landroid/content/res/Resources;
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    #getter for: Lcom/android/server/EncryptService$CryptoNotification;->isWokingNotification:Z
    invoke-static {v9}, Lcom/android/server/EncryptService$CryptoNotification;->access$500(Lcom/android/server/EncryptService$CryptoNotification;)Z

    move-result v9

    if-nez v9, :cond_14

    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    #getter for: Lcom/android/server/EncryptService$CryptoNotification;->mFinished:Z
    invoke-static {v9}, Lcom/android/server/EncryptService$CryptoNotification;->access$600(Lcom/android/server/EncryptService$CryptoNotification;)Z

    move-result v9

    if-eqz v9, :cond_15

    .line 688
    :cond_14
    :goto_14
    return-void

    .line 624
    :cond_15
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const/4 v10, 0x1

    #setter for: Lcom/android/server/EncryptService$CryptoNotification;->isWokingNotification:Z
    invoke-static {v9, v10}, Lcom/android/server/EncryptService$CryptoNotification;->access$502(Lcom/android/server/EncryptService$CryptoNotification;Z)Z

    .line 626
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mCtx:Landroid/content/Context;

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 628
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget v10, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$lv_percent:I

    iput v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->mPercent:I

    .line 630
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    if-nez v9, :cond_42

    .line 632
    iget-boolean v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bCryptoPolicy:Z

    if-eqz v9, :cond_14e

    .line 634
    iget-boolean v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bFirstStorage:Z

    if-nez v9, :cond_141

    .line 635
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const v10, 0x104050d

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    .line 648
    :cond_42
    :goto_42
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotiManager:Landroid/app/NotificationManager;

    if-nez v9, :cond_58

    .line 650
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v10, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v10, v10, Lcom/android/server/EncryptService$CryptoNotification;->mCtx:Landroid/content/Context;

    const-string v11, "notification"

    invoke-virtual {v10, v11}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    iput-object v0, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotiManager:Landroid/app/NotificationManager;

    .line 653
    :cond_58
    const/4 v2, 0x0

    .line 655
    .local v2, icon:I
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    if-nez v9, :cond_7f

    .line 657
    iget-boolean v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bCryptoPolicy:Z

    if-eqz v9, :cond_16c

    .line 658
    const v2, 0x10803f8

    .line 662
    :goto_66
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    .line 663
    .local v7, when:J
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    new-instance v10, Landroid/app/Notification;

    const-string v11, ""

    invoke-direct {v10, v2, v11, v7, v8}, Landroid/app/Notification;-><init>(ILjava/lang/CharSequence;J)V

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    .line 664
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    iget v10, v9, Landroid/app/Notification;->flags:I

    or-int/lit8 v10, v10, 0x22

    iput v10, v9, Landroid/app/Notification;->flags:I

    .line 667
    .end local v7           #when:J
    :cond_7f
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    if-nez v9, :cond_e6

    .line 669
    new-instance v5, Landroid/content/Intent;

    invoke-direct {v5}, Landroid/content/Intent;-><init>()V

    .line 670
    .local v5, notificationIntent:Landroid/content/Intent;
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mCtx:Landroid/content/Context;

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-static {v9, v10, v5, v11}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 671
    .local v0, contentIntent:Landroid/app/PendingIntent;
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    new-instance v10, Landroid/widget/RemoteViews;

    iget-object v11, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v11, v11, Lcom/android/server/EncryptService$CryptoNotification;->mCtx:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v11

    const v12, 0x1090028

    invoke-direct {v10, v11, v12}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    .line 672
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x10201bc

    const/16 v11, 0x8

    invoke-virtual {v9, v10, v11}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 673
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x10201b8

    invoke-virtual {v9, v10, v2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 674
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x1020016

    const/4 v11, -0x1

    invoke-virtual {v9, v10, v11}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 675
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x10201b9

    const v11, -0x333334

    invoke-virtual {v9, v10, v11}, Landroid/widget/RemoteViews;->setTextColor(II)V

    .line 676
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    iget-object v10, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v10, v10, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    iput-object v10, v9, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 677
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    iput-object v0, v9, Landroid/app/Notification;->contentIntent:Landroid/app/PendingIntent;

    .line 680
    .end local v0           #contentIntent:Landroid/app/PendingIntent;
    .end local v5           #notificationIntent:Landroid/content/Intent;
    :cond_e6
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x10201b9

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "("

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget v12, v12, Lcom/android/server/EncryptService$CryptoNotification;->mPercent:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "%)"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v10, v11}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 681
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x1020016

    iget-object v11, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v11, v11, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    invoke-virtual {v9, v10, v11}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 683
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mContentView:Landroid/widget/RemoteViews;

    const v10, 0x10201bb

    const/16 v11, 0x64

    iget-object v12, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget v12, v12, Lcom/android/server/EncryptService$CryptoNotification;->mPercent:I

    const/4 v13, 0x0

    invoke-virtual {v9, v10, v11, v12, v13}, Landroid/widget/RemoteViews;->setProgressBar(IIIZ)V

    .line 685
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v9, v9, Lcom/android/server/EncryptService$CryptoNotification;->mNotiManager:Landroid/app/NotificationManager;

    const/16 v10, 0x2712

    iget-object v11, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    iget-object v11, v11, Lcom/android/server/EncryptService$CryptoNotification;->mNotification:Landroid/app/Notification;

    invoke-virtual {v9, v10, v11}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 687
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const/4 v10, 0x0

    #setter for: Lcom/android/server/EncryptService$CryptoNotification;->isWokingNotification:Z
    invoke-static {v9, v10}, Lcom/android/server/EncryptService$CryptoNotification;->access$502(Lcom/android/server/EncryptService$CryptoNotification;Z)Z

    goto/16 :goto_14

    .line 637
    .end local v2           #icon:I
    :cond_141
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const v10, 0x104050c

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    goto/16 :goto_42

    .line 641
    :cond_14e
    iget-boolean v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->val$bFirstStorage:Z

    if-nez v9, :cond_15f

    .line 642
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const v10, 0x104050f

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    goto/16 :goto_42

    .line 644
    :cond_15f
    iget-object v9, p0, Lcom/android/server/EncryptService$CryptoNotification$1;->this$1:Lcom/android/server/EncryptService$CryptoNotification;

    const v10, 0x104050e

    invoke-virtual {v1, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/android/server/EncryptService$CryptoNotification;->title:Ljava/lang/String;

    goto/16 :goto_42

    .line 660
    .restart local v2       #icon:I
    :cond_16c
    const v2, 0x10803f7

    goto/16 :goto_66
.end method
