.class Lcom/android/server/UiModeManagerService$8;
.super Landroid/os/Handler;
.source "UiModeManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/UiModeManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field mDidFirstInit:Z

.field mLastNetworkRegisterTime:J

.field mNetworkListenerEnabled:Z

.field mPassiveListenerEnabled:Z

.field final synthetic this$0:Lcom/android/server/UiModeManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/UiModeManagerService;)V
    .registers 4
    .parameter

    .prologue
    .line 606
    iput-object p1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 611
    const-wide/32 v0, -0x1b7740

    iput-wide v0, p0, Lcom/android/server/UiModeManagerService$8;->mLastNetworkRegisterTime:J

    return-void
.end method

.method private retrieveLocation()V
    .registers 13

    .prologue
    .line 711
    const/4 v4, 0x0

    .line 712
    .local v4, location:Landroid/location/Location;
    iget-object v6, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v6}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v6

    new-instance v7, Landroid/location/Criteria;

    invoke-direct {v7}, Landroid/location/Criteria;-><init>()V

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Landroid/location/LocationManager;->getProviders(Landroid/location/Criteria;Z)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 714
    .local v5, providers:Ljava/util/Iterator;,"Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_15
    :goto_15
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3d

    .line 715
    iget-object v6, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v6}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v7, v6}, Landroid/location/LocationManager;->getLastKnownLocation(Ljava/lang/String;)Landroid/location/Location;

    move-result-object v1

    .line 718
    .local v1, lastKnownLocation:Landroid/location/Location;
    if-eqz v4, :cond_3b

    if-eqz v1, :cond_15

    invoke-virtual {v4}, Landroid/location/Location;->getTime()J

    move-result-wide v6

    invoke-virtual {v1}, Landroid/location/Location;->getTime()J

    move-result-wide v8

    cmp-long v6, v6, v8

    if-gez v6, :cond_15

    .line 720
    :cond_3b
    move-object v4, v1

    goto :goto_15

    .line 726
    .end local v1           #lastKnownLocation:Landroid/location/Location;
    :cond_3d
    if-nez v4, :cond_79

    .line 727
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 728
    .local v0, currentTime:Landroid/text/format/Time;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v0, v6, v7}, Landroid/text/format/Time;->set(J)V

    .line 729
    const-wide v6, 0x3f71111111111111L

    iget-wide v8, v0, Landroid/text/format/Time;->gmtoff:J

    iget v10, v0, Landroid/text/format/Time;->isDst:I

    if-lez v10, :cond_85

    const/16 v10, 0xe10

    :goto_58
    int-to-long v10, v10

    sub-long/2addr v8, v10

    long-to-double v8, v8

    mul-double v2, v6, v8

    .line 731
    .local v2, lngOffset:D
    new-instance v4, Landroid/location/Location;

    .end local v4           #location:Landroid/location/Location;
    const-string v6, "fake"

    invoke-direct {v4, v6}, Landroid/location/Location;-><init>(Ljava/lang/String;)V

    .line 732
    .restart local v4       #location:Landroid/location/Location;
    invoke-virtual {v4, v2, v3}, Landroid/location/Location;->setLongitude(D)V

    .line 733
    const-wide/16 v6, 0x0

    invoke-virtual {v4, v6, v7}, Landroid/location/Location;->setLatitude(D)V

    .line 734
    const v6, 0x48cb9d00

    invoke-virtual {v4, v6}, Landroid/location/Location;->setAccuracy(F)V

    .line 735
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Landroid/location/Location;->setTime(J)V

    .line 737
    .end local v0           #currentTime:Landroid/text/format/Time;
    .end local v2           #lngOffset:D
    :cond_79
    iget-object v6, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v6, v6, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 738
    :try_start_7e
    iget-object v7, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #setter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v7, v4}, Lcom/android/server/UiModeManagerService;->access$702(Lcom/android/server/UiModeManagerService;Landroid/location/Location;)Landroid/location/Location;

    .line 739
    monitor-exit v6

    .line 740
    return-void

    .line 729
    .restart local v0       #currentTime:Landroid/text/format/Time;
    :cond_85
    const/4 v10, 0x0

    goto :goto_58

    .line 739
    .end local v0           #currentTime:Landroid/text/format/Time;
    :catchall_87
    move-exception v7

    monitor-exit v6
    :try_end_89
    .catchall {:try_start_7e .. :try_end_89} :catchall_87

    throw v7
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 15
    .parameter "msg"

    .prologue
    .line 615
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_148

    .line 708
    :cond_5
    :goto_5
    return-void

    .line 617
    :pswitch_6
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v0, v0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 618
    :try_start_b
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->isDoingNightMode()Z

    move-result v1

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$700(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v1

    if-eqz v1, :cond_2f

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mNightMode:I
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$300(Lcom/android/server/UiModeManagerService;)I

    move-result v1

    if-nez v1, :cond_2f

    .line 620
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->updateTwilightLocked()V

    .line 621
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 623
    :cond_2f
    monitor-exit v0

    goto :goto_5

    :catchall_31
    move-exception v1

    monitor-exit v0
    :try_end_33
    .catchall {:try_start_b .. :try_end_33} :catchall_31

    throw v1

    .line 626
    :pswitch_34
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mNetworkListenerEnabled:Z

    if-eqz v0, :cond_5

    .line 631
    iget-wide v0, p0, Lcom/android/server/UiModeManagerService$8;->mLastNetworkRegisterTime:J

    const-wide/32 v2, 0x1b7740

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-gez v0, :cond_5

    .line 640
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mNetworkListenerEnabled:Z

    .line 641
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->removeUpdates(Landroid/location/LocationListener;)V

    .line 649
    :pswitch_58
    :try_start_58
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "network"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_63
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_63} :catch_131

    move-result v10

    .line 656
    .local v10, networkLocationEnabled:Z
    :goto_64
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mNetworkListenerEnabled:Z

    if-nez v0, :cond_c4

    if-eqz v10, :cond_c4

    .line 657
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mNetworkListenerEnabled:Z

    .line 658
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/UiModeManagerService$8;->mLastNetworkRegisterTime:J

    .line 659
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "network"

    const-wide/32 v2, 0x5265c00

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mEmptyLocationListener:Landroid/location/LocationListener;
    invoke-static {v5}, Lcom/android/server/UiModeManagerService;->access$800(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 662
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mDidFirstInit:Z

    if-nez v0, :cond_c4

    .line 663
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mDidFirstInit:Z

    .line 664
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$700(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v0

    if-nez v0, :cond_9a

    .line 665
    invoke-direct {p0}, Lcom/android/server/UiModeManagerService$8;->retrieveLocation()V

    .line 667
    :cond_9a
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    iget-object v0, v0, Lcom/android/server/UiModeManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 668
    :try_start_9f
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->isDoingNightMode()Z

    move-result v1

    if-eqz v1, :cond_c3

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocation:Landroid/location/Location;
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$700(Lcom/android/server/UiModeManagerService;)Landroid/location/Location;

    move-result-object v1

    if-eqz v1, :cond_c3

    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mNightMode:I
    invoke-static {v1}, Lcom/android/server/UiModeManagerService;->access$300(Lcom/android/server/UiModeManagerService;)I

    move-result v1

    if-nez v1, :cond_c3

    .line 670
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    invoke-virtual {v1}, Lcom/android/server/UiModeManagerService;->updateTwilightLocked()V

    .line 671
    iget-object v1, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lcom/android/server/UiModeManagerService;->updateLocked(II)V

    .line 673
    :cond_c3
    monitor-exit v0
    :try_end_c4
    .catchall {:try_start_9f .. :try_end_c4} :catchall_136

    .line 680
    :cond_c4
    :try_start_c4
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "passive"

    invoke-virtual {v0, v1}, Landroid/location/LocationManager;->isProviderEnabled(Ljava/lang/String;)Z
    :try_end_cf
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_cf} :catch_139

    move-result v12

    .line 687
    .local v12, passiveLocationEnabled:Z
    :goto_d0
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mPassiveListenerEnabled:Z

    if-nez v0, :cond_ef

    if-eqz v12, :cond_ef

    .line 688
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mPassiveListenerEnabled:Z

    .line 689
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationManager:Landroid/location/LocationManager;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$900(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationManager;

    move-result-object v0

    const-string v1, "passive"

    const-wide/16 v2, 0x0

    const v4, 0x469c4000

    iget-object v5, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mLocationListener:Landroid/location/LocationListener;
    invoke-static {v5}, Lcom/android/server/UiModeManagerService;->access$1000(Lcom/android/server/UiModeManagerService;)Landroid/location/LocationListener;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Landroid/location/LocationManager;->requestLocationUpdates(Ljava/lang/String;JFLandroid/location/LocationListener;)V

    .line 692
    :cond_ef
    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mNetworkListenerEnabled:Z

    if-eqz v0, :cond_f7

    iget-boolean v0, p0, Lcom/android/server/UiModeManagerService$8;->mPassiveListenerEnabled:Z

    if-nez v0, :cond_5

    .line 693
    :cond_f7
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "LAST_UPDATE_INTERVAL"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v8

    .line 694
    .local v8, interval:J
    long-to-double v0, v8

    const-wide/high16 v2, 0x3ff8

    mul-double/2addr v0, v2

    double-to-long v8, v0

    .line 695
    const-wide/16 v0, 0x0

    cmp-long v0, v8, v0

    if-nez v0, :cond_13d

    .line 696
    const-wide/16 v8, 0x1388

    .line 700
    :cond_10e
    :goto_10e
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 701
    .local v6, bundle:Landroid/os/Bundle;
    const-string v0, "LAST_UPDATE_INTERVAL"

    invoke-virtual {v6, v0, v8, v9}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 702
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$400(Lcom/android/server/UiModeManagerService;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v11

    .line 703
    .local v11, newMsg:Landroid/os/Message;
    invoke-virtual {v11, v6}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 704
    iget-object v0, p0, Lcom/android/server/UiModeManagerService$8;->this$0:Lcom/android/server/UiModeManagerService;

    #getter for: Lcom/android/server/UiModeManagerService;->mHandler:Landroid/os/Handler;
    invoke-static {v0}, Lcom/android/server/UiModeManagerService;->access$400(Lcom/android/server/UiModeManagerService;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, v11, v8, v9}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto/16 :goto_5

    .line 651
    .end local v6           #bundle:Landroid/os/Bundle;
    .end local v8           #interval:J
    .end local v10           #networkLocationEnabled:Z
    .end local v11           #newMsg:Landroid/os/Message;
    .end local v12           #passiveLocationEnabled:Z
    :catch_131
    move-exception v0

    move-object v7, v0

    .line 654
    .local v7, e:Ljava/lang/Exception;
    const/4 v10, 0x0

    .restart local v10       #networkLocationEnabled:Z
    goto/16 :goto_64

    .line 673
    .end local v7           #e:Ljava/lang/Exception;
    :catchall_136
    move-exception v1

    :try_start_137
    monitor-exit v0
    :try_end_138
    .catchall {:try_start_137 .. :try_end_138} :catchall_136

    throw v1

    .line 682
    :catch_139
    move-exception v0

    move-object v7, v0

    .line 685
    .restart local v7       #e:Ljava/lang/Exception;
    const/4 v12, 0x0

    .restart local v12       #passiveLocationEnabled:Z
    goto :goto_d0

    .line 697
    .end local v7           #e:Ljava/lang/Exception;
    .restart local v8       #interval:J
    :cond_13d
    const-wide/32 v0, 0xdbba0

    cmp-long v0, v8, v0

    if-lez v0, :cond_10e

    .line 698
    const-wide/32 v8, 0xdbba0

    goto :goto_10e

    .line 615
    :pswitch_data_148
    .packed-switch 0x0
        :pswitch_6
        :pswitch_58
        :pswitch_34
    .end packed-switch
.end method
