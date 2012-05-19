.class final Lcom/android/server/WindowManagerService$InputMonitor;
.super Ljava/lang/Object;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "InputMonitor"
.end annotation


# instance fields
.field private mInputDispatchEnabled:Z

.field private mInputDispatchFrozen:Z

.field private mInputFocus:Lcom/android/server/WindowManagerService$WindowState;

.field private mTempInputApplication:Lcom/android/server/InputApplication;

.field private mTempInputWindows:Lcom/android/server/InputWindowList;

.field final synthetic this$0:Lcom/android/server/WindowManagerService;


# direct methods
.method constructor <init>(Lcom/android/server/WindowManagerService;)V
    .registers 3
    .parameter

    .prologue
    .line 5454
    iput-object p1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5462
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchEnabled:Z

    .line 5465
    new-instance v0, Lcom/android/server/InputWindowList;

    invoke-direct {v0}, Lcom/android/server/InputWindowList;-><init>()V

    iput-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputWindows:Lcom/android/server/InputWindowList;

    .line 5468
    new-instance v0, Lcom/android/server/InputApplication;

    invoke-direct {v0}, Lcom/android/server/InputApplication;-><init>()V

    iput-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputApplication:Lcom/android/server/InputApplication;

    return-void
.end method

.method private getWindowStateForInputChannel(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;
    .registers 4
    .parameter "inputChannel"

    .prologue
    .line 5527
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v0

    .line 5528
    :try_start_5
    invoke-direct {p0, p1}, Lcom/android/server/WindowManagerService$InputMonitor;->getWindowStateForInputChannelLocked(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 5529
    :catchall_b
    move-exception v1

    monitor-exit v0
    :try_end_d
    .catchall {:try_start_5 .. :try_end_d} :catchall_b

    throw v1
.end method

.method private getWindowStateForInputChannelLocked(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;
    .registers 6
    .parameter "inputChannel"

    .prologue
    .line 5533
    iget-object v3, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 5534
    .local v1, windowCount:I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_9
    if-ge v0, v1, :cond_1e

    .line 5535
    iget-object v3, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v3, Lcom/android/server/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/WindowManagerService$WindowState;

    .line 5536
    .local v2, windowState:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v3, v2, Lcom/android/server/WindowManagerService$WindowState;->mInputChannel:Landroid/view/InputChannel;

    if-ne v3, p1, :cond_1b

    move-object v3, v2

    .line 5541
    .end local v2           #windowState:Lcom/android/server/WindowManagerService$WindowState;
    :goto_1a
    return-object v3

    .line 5534
    .restart local v2       #windowState:Lcom/android/server/WindowManagerService$WindowState;
    :cond_1b
    add-int/lit8 v0, v0, 0x1

    goto :goto_9

    .line 5541
    .end local v2           #windowState:Lcom/android/server/WindowManagerService$WindowState;
    :cond_1e
    const/4 v3, 0x0

    goto :goto_1a
.end method

.method private notifyKeytracer(III)V
    .registers 13
    .parameter "action"
    .parameter "keyCode"
    .parameter "flags"

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 5769
    const-string v4, "net.cdma.factory.KEYTRACE"

    const-string v5, "STOP"

    invoke-static {v4, v5}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "START"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_14

    .line 5796
    :cond_13
    :goto_13
    return-void

    .line 5774
    :cond_14
    const/4 v4, 0x7

    new-array v0, v4, [I

    .line 5775
    .local v0, dataArry:[I
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v4

    long-to-int v1, v4

    .line 5776
    .local v1, eventTime:I
    new-instance v2, Landroid/content/Intent;

    const-string v4, "com.android.keytracer.sendKeytraceData"

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 5777
    .local v2, intent:Landroid/content/Intent;
    invoke-direct {p0, p2}, Lcom/android/server/WindowManagerService$InputMonitor;->translateKeycodeForKeytracer(I)I

    move-result v3

    .line 5779
    .local v3, keycode:I
    const/4 v4, -0x1

    if-eq v3, v4, :cond_13

    .line 5780
    aput v1, v0, v6

    .line 5781
    int-to-char v4, p1

    aput v4, v0, v7

    .line 5782
    int-to-char v4, v3

    aput v4, v0, v8

    .line 5783
    const/4 v4, 0x3

    aput v6, v0, v4

    .line 5784
    const/4 v4, 0x4

    aput v6, v0, v4

    .line 5785
    const/4 v4, 0x5

    aput v6, v0, v4

    .line 5786
    const/4 v4, 0x6

    aput v6, v0, v4

    .line 5788
    invoke-virtual {p0, p3}, Lcom/android/server/WindowManagerService$InputMonitor;->isLongPress(I)Z

    move-result v4

    if-eqz v4, :cond_4d

    .line 5789
    const-string v4, "WindowManagerService"

    const-string v5, "longkeyaction"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 5790
    aput v8, v0, v7

    .line 5792
    :cond_4d
    const-string v4, "KEYTRACE_DATA"

    invoke-virtual {v2, v4, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[I)Landroid/content/Intent;

    .line 5794
    iget-object v4, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_13
.end method

.method private translateKeycodeForKeytracer(I)I
    .registers 3
    .parameter "inkeycode"

    .prologue
    .line 5684
    packed-switch p1, :pswitch_data_100

    .line 5761
    :pswitch_3
    const/4 v0, -0x1

    .line 5764
    .local v0, outKeyCode:I
    :goto_4
    return v0

    .line 5686
    .end local v0           #outKeyCode:I
    :pswitch_5
    const/16 v0, 0x30

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5687
    .end local v0           #outKeyCode:I
    :pswitch_8
    const/16 v0, 0x31

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5688
    .end local v0           #outKeyCode:I
    :pswitch_b
    const/16 v0, 0x32

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5689
    .end local v0           #outKeyCode:I
    :pswitch_e
    const/16 v0, 0x33

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5690
    .end local v0           #outKeyCode:I
    :pswitch_11
    const/16 v0, 0x34

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5691
    .end local v0           #outKeyCode:I
    :pswitch_14
    const/16 v0, 0x35

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5692
    .end local v0           #outKeyCode:I
    :pswitch_17
    const/16 v0, 0x36

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5693
    .end local v0           #outKeyCode:I
    :pswitch_1a
    const/16 v0, 0x37

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5694
    .end local v0           #outKeyCode:I
    :pswitch_1d
    const/16 v0, 0x38

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5695
    .end local v0           #outKeyCode:I
    :pswitch_20
    const/16 v0, 0x39

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5696
    .end local v0           #outKeyCode:I
    :pswitch_23
    const/16 v0, 0x50

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5697
    .end local v0           #outKeyCode:I
    :pswitch_26
    const/16 v0, 0x51

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5698
    .end local v0           #outKeyCode:I
    :pswitch_29
    const/16 v0, 0x23

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5699
    .end local v0           #outKeyCode:I
    :pswitch_2c
    const/16 v0, 0x2a

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5700
    .end local v0           #outKeyCode:I
    :pswitch_2f
    const/16 v0, 0x52

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5701
    .end local v0           #outKeyCode:I
    :pswitch_32
    const/16 v0, 0x63

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5702
    .end local v0           #outKeyCode:I
    :pswitch_35
    const/16 v0, 0x64

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5703
    .end local v0           #outKeyCode:I
    :pswitch_38
    const/16 v0, 0x65

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5704
    .end local v0           #outKeyCode:I
    :pswitch_3b
    const/16 v0, 0x66

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5705
    .end local v0           #outKeyCode:I
    :pswitch_3e
    const/16 v0, 0x8d

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5706
    .end local v0           #outKeyCode:I
    :pswitch_41
    const/16 v0, 0x8c

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5707
    .end local v0           #outKeyCode:I
    :pswitch_44
    const/16 v0, 0x5b

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5708
    .end local v0           #outKeyCode:I
    :pswitch_47
    const/16 v0, 0x5c

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5709
    .end local v0           #outKeyCode:I
    :pswitch_4a
    const/16 v0, 0x95

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5710
    .end local v0           #outKeyCode:I
    :pswitch_4d
    const/16 v0, 0x98

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5711
    .end local v0           #outKeyCode:I
    :pswitch_50
    const/16 v0, 0xb6

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5712
    .end local v0           #outKeyCode:I
    :pswitch_53
    const/16 v0, 0xb6

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5713
    .end local v0           #outKeyCode:I
    :pswitch_56
    const/16 v0, 0xe3

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5714
    .end local v0           #outKeyCode:I
    :pswitch_59
    const/16 v0, 0xf1

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5715
    .end local v0           #outKeyCode:I
    :pswitch_5c
    const/16 v0, 0xef

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5716
    .end local v0           #outKeyCode:I
    :pswitch_5f
    const/16 v0, 0xe5

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5717
    .end local v0           #outKeyCode:I
    :pswitch_62
    const/16 v0, 0xf8

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5718
    .end local v0           #outKeyCode:I
    :pswitch_65
    const/16 v0, 0xe6

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5719
    .end local v0           #outKeyCode:I
    :pswitch_68
    const/16 v0, 0xe7

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5720
    .end local v0           #outKeyCode:I
    :pswitch_6b
    const/16 v0, 0xe8

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5721
    .end local v0           #outKeyCode:I
    :pswitch_6e
    const/16 v0, 0xc4

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5722
    .end local v0           #outKeyCode:I
    :pswitch_71
    const/16 v0, 0xe9

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5723
    .end local v0           #outKeyCode:I
    :pswitch_74
    const/16 v0, 0xea

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5724
    .end local v0           #outKeyCode:I
    :pswitch_77
    const/16 v0, 0xeb

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5725
    .end local v0           #outKeyCode:I
    :pswitch_7a
    const/16 v0, 0xf3

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5726
    .end local v0           #outKeyCode:I
    :pswitch_7d
    const/16 v0, 0xf2

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5727
    .end local v0           #outKeyCode:I
    :pswitch_80
    const/16 v0, 0xc5

    .restart local v0       #outKeyCode:I
    goto :goto_4

    .line 5728
    .end local v0           #outKeyCode:I
    :pswitch_83
    const/16 v0, 0xc6

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5729
    .end local v0           #outKeyCode:I
    :pswitch_87
    const/16 v0, 0xc0

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5730
    .end local v0           #outKeyCode:I
    :pswitch_8b
    const/16 v0, 0xec

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5731
    .end local v0           #outKeyCode:I
    :pswitch_8f
    const/16 v0, 0xe4

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5732
    .end local v0           #outKeyCode:I
    :pswitch_93
    const/16 v0, 0xc1

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5733
    .end local v0           #outKeyCode:I
    :pswitch_97
    const/16 v0, 0xc3

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5734
    .end local v0           #outKeyCode:I
    :pswitch_9b
    const/16 v0, 0xf0

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5735
    .end local v0           #outKeyCode:I
    :pswitch_9f
    const/16 v0, 0xc7

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5736
    .end local v0           #outKeyCode:I
    :pswitch_a3
    const/16 v0, 0xee

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5737
    .end local v0           #outKeyCode:I
    :pswitch_a7
    const/16 v0, 0xc2

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5738
    .end local v0           #outKeyCode:I
    :pswitch_ab
    const/16 v0, 0xed

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5739
    .end local v0           #outKeyCode:I
    :pswitch_af
    const/16 v0, 0xf7

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5740
    .end local v0           #outKeyCode:I
    :pswitch_b3
    const/16 v0, 0xe1

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5741
    .end local v0           #outKeyCode:I
    :pswitch_b7
    const/16 v0, 0xe1

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5742
    .end local v0           #outKeyCode:I
    :pswitch_bb
    const/16 v0, 0xf4

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5743
    .end local v0           #outKeyCode:I
    :pswitch_bf
    const/16 v0, 0xc8

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5744
    .end local v0           #outKeyCode:I
    :pswitch_c3
    const/16 v0, 0x5c

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5745
    .end local v0           #outKeyCode:I
    :pswitch_c7
    const/16 v0, 0x54

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5746
    .end local v0           #outKeyCode:I
    :pswitch_cb
    const/16 v0, 0x55

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5747
    .end local v0           #outKeyCode:I
    :pswitch_cf
    const/16 v0, 0x1b

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5748
    .end local v0           #outKeyCode:I
    :pswitch_d3
    const/16 v0, 0xca

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5749
    .end local v0           #outKeyCode:I
    :pswitch_d7
    const/16 v0, 0xf6

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5750
    .end local v0           #outKeyCode:I
    :pswitch_db
    const/16 v0, 0x1f

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5751
    .end local v0           #outKeyCode:I
    :pswitch_df
    const/16 v0, 0x20

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5752
    .end local v0           #outKeyCode:I
    :pswitch_e3
    const/16 v0, 0x21

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5753
    .end local v0           #outKeyCode:I
    :pswitch_e7
    const/16 v0, 0xf5

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5754
    .end local v0           #outKeyCode:I
    :pswitch_eb
    const/16 v0, 0x23

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5755
    .end local v0           #outKeyCode:I
    :pswitch_ef
    const/16 v0, 0x24

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5757
    .end local v0           #outKeyCode:I
    :pswitch_f3
    const/16 v0, 0xb

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5758
    .end local v0           #outKeyCode:I
    :pswitch_f7
    const/16 v0, 0xb5

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5760
    .end local v0           #outKeyCode:I
    :pswitch_fb
    const/16 v0, 0x26

    .restart local v0       #outKeyCode:I
    goto/16 :goto_4

    .line 5684
    nop

    :pswitch_data_100
    .packed-switch 0x2
        :pswitch_47
        :pswitch_4d
        :pswitch_c3
        :pswitch_23
        :pswitch_26
        :pswitch_5
        :pswitch_8
        :pswitch_b
        :pswitch_e
        :pswitch_11
        :pswitch_14
        :pswitch_17
        :pswitch_1a
        :pswitch_1d
        :pswitch_20
        :pswitch_2c
        :pswitch_29
        :pswitch_32
        :pswitch_35
        :pswitch_38
        :pswitch_3b
        :pswitch_41
        :pswitch_c7
        :pswitch_cb
        :pswitch_4a
        :pswitch_3e
        :pswitch_2f
        :pswitch_56
        :pswitch_59
        :pswitch_5c
        :pswitch_5f
        :pswitch_62
        :pswitch_65
        :pswitch_68
        :pswitch_6b
        :pswitch_6e
        :pswitch_71
        :pswitch_74
        :pswitch_77
        :pswitch_7a
        :pswitch_7d
        :pswitch_80
        :pswitch_83
        :pswitch_87
        :pswitch_8b
        :pswitch_8f
        :pswitch_93
        :pswitch_97
        :pswitch_9b
        :pswitch_9f
        :pswitch_a3
        :pswitch_a7
        :pswitch_ab
        :pswitch_bf
        :pswitch_e7
        :pswitch_b3
        :pswitch_b7
        :pswitch_50
        :pswitch_53
        :pswitch_cf
        :pswitch_af
        :pswitch_3
        :pswitch_f7
        :pswitch_f3
        :pswitch_bb
        :pswitch_d7
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_df
        :pswitch_e3
        :pswitch_3
        :pswitch_3
        :pswitch_eb
        :pswitch_db
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_44
        :pswitch_3
        :pswitch_fb
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_3
        :pswitch_ef
        :pswitch_d3
    .end packed-switch
.end method

.method private updateInputDispatchModeLw()V
    .registers 4

    .prologue
    .line 5876
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputManager:Lcom/android/server/InputManager;

    iget-boolean v1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchEnabled:Z

    iget-boolean v2, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchFrozen:Z

    invoke-virtual {v0, v1, v2}, Lcom/android/server/InputManager;->setInputDispatchMode(ZZ)V

    .line 5877
    return-void
.end method


# virtual methods
.method public freezeInputDispatchingLw()V
    .registers 2

    .prologue
    .line 5843
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchFrozen:Z

    if-nez v0, :cond_a

    .line 5848
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchFrozen:Z

    .line 5849
    invoke-direct {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputDispatchModeLw()V

    .line 5851
    :cond_a
    return-void
.end method

.method public interceptKeyBeforeDispatching(Landroid/view/InputChannel;IIIIIII)Z
    .registers 18
    .parameter "focus"
    .parameter "action"
    .parameter "flags"
    .parameter "keyCode"
    .parameter "scanCode"
    .parameter "metaState"
    .parameter "repeatCount"
    .parameter "policyFlags"

    .prologue
    .line 5654
    invoke-direct {p0, p1}, Lcom/android/server/WindowManagerService$InputMonitor;->getWindowStateForInputChannel(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;

    move-result-object v1

    .line 5655
    .local v1, windowState:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-interface/range {v0 .. v8}, Landroid/view/WindowManagerPolicy;->interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;IIIIIII)Z

    move-result v0

    return v0
.end method

.method public interceptKeyBeforeQueueing(JIIIIIZ)I
    .registers 18
    .parameter "whenNanos"
    .parameter "action"
    .parameter "flags"
    .parameter "keyCode"
    .parameter "scanCode"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    .line 5643
    invoke-direct {p0, p3, p5, p4}, Lcom/android/server/WindowManagerService$InputMonitor;->notifyKeytracer(III)V

    .line 5644
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-wide v1, p1

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-interface/range {v0 .. v8}, Landroid/view/WindowManagerPolicy;->interceptKeyBeforeQueueing(JIIIIIZ)I

    move-result v0

    return v0
.end method

.method public final isLongPress(I)Z
    .registers 4
    .parameter "flags"

    .prologue
    .line 5798
    const-string v0, "136"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 5799
    const/4 v0, 0x1

    .line 5801
    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d
.end method

.method public notifyANR(Ljava/lang/Object;Landroid/view/InputChannel;)J
    .registers 12
    .parameter "token"
    .parameter "inputChannel"

    .prologue
    const-string v8, "WindowManagerService"

    .line 5492
    const/4 v2, 0x0

    .line 5493
    .local v2, appWindowToken:Lcom/android/server/WindowManagerService$AppWindowToken;
    if-eqz p2, :cond_31

    .line 5494
    iget-object v4, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 5495
    :try_start_a
    invoke-direct {p0, p2}, Lcom/android/server/WindowManagerService$InputMonitor;->getWindowStateForInputChannelLocked(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;

    move-result-object v3

    .line 5496
    .local v3, windowState:Lcom/android/server/WindowManagerService$WindowState;
    if-eqz v3, :cond_30

    .line 5497
    const-string v5, "WindowManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Input event dispatching timed out sending to "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v3, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v7}, Landroid/view/WindowManager$LayoutParams;->getTitle()Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 5499
    iget-object v2, v3, Lcom/android/server/WindowManagerService$WindowState;->mAppToken:Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 5501
    :cond_30
    monitor-exit v4
    :try_end_31
    .catchall {:try_start_a .. :try_end_31} :catchall_64

    .line 5504
    .end local v3           #windowState:Lcom/android/server/WindowManagerService$WindowState;
    :cond_31
    if-nez v2, :cond_53

    if-eqz p1, :cond_53

    .line 5505
    move-object v0, p1

    check-cast v0, Lcom/android/server/WindowManagerService$AppWindowToken;

    move-object v2, v0

    .line 5506
    const-string v4, "WindowManagerService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Input event dispatching timed out sending to application "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v2, Lcom/android/server/WindowManagerService$WindowToken;->stringName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v8, v4}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 5510
    :cond_53
    if-eqz v2, :cond_68

    iget-object v4, v2, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    if-eqz v4, :cond_68

    .line 5514
    :try_start_59
    iget-object v4, v2, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    invoke-interface {v4}, Landroid/view/IApplicationToken;->keyDispatchingTimedOut()Z

    move-result v1

    .line 5515
    .local v1, abort:Z
    if-nez v1, :cond_68

    .line 5518
    iget-wide v4, v2, Lcom/android/server/WindowManagerService$AppWindowToken;->inputDispatchingTimeoutNanos:J
    :try_end_63
    .catch Landroid/os/RemoteException; {:try_start_59 .. :try_end_63} :catch_67

    .line 5523
    .end local v1           #abort:Z
    :goto_63
    return-wide v4

    .line 5501
    :catchall_64
    move-exception v5

    :try_start_65
    monitor-exit v4
    :try_end_66
    .catchall {:try_start_65 .. :try_end_66} :catchall_64

    throw v5

    .line 5520
    :catch_67
    move-exception v4

    .line 5523
    :cond_68
    const-wide/16 v4, 0x0

    goto :goto_63
.end method

.method public notifyInputChannelBroken(Landroid/view/InputChannel;)V
    .registers 6
    .parameter "inputChannel"

    .prologue
    .line 5475
    iget-object v1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v1, v1, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v1

    .line 5476
    :try_start_5
    invoke-direct {p0, p1}, Lcom/android/server/WindowManagerService$InputMonitor;->getWindowStateForInputChannelLocked(Landroid/view/InputChannel;)Lcom/android/server/WindowManagerService$WindowState;

    move-result-object v0

    .line 5477
    .local v0, windowState:Lcom/android/server/WindowManagerService$WindowState;
    if-nez v0, :cond_d

    .line 5478
    monitor-exit v1

    .line 5484
    :goto_c
    return-void

    .line 5482
    :cond_d
    iget-object v2, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v3, v0, Lcom/android/server/WindowManagerService$WindowState;->mSession:Lcom/android/server/WindowManagerService$Session;

    invoke-virtual {v2, v3, v0}, Lcom/android/server/WindowManagerService;->removeWindowLocked(Lcom/android/server/WindowManagerService$Session;Lcom/android/server/WindowManagerService$WindowState;)V

    .line 5483
    monitor-exit v1

    goto :goto_c

    .end local v0           #windowState:Lcom/android/server/WindowManagerService$WindowState;
    :catchall_16
    move-exception v2

    monitor-exit v1
    :try_end_18
    .catchall {:try_start_5 .. :try_end_18} :catchall_16

    throw v2
.end method

.method public notifyLidSwitchChanged(JZ)V
    .registers 5
    .parameter "whenNanos"
    .parameter "lidOpen"

    .prologue
    .line 5635
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    invoke-interface {v0, p1, p2, p3}, Landroid/view/WindowManagerPolicy;->notifyLidSwitchChanged(JZ)V

    .line 5636
    return-void
.end method

.method public pauseDispatchingLw(Lcom/android/server/WindowManagerService$WindowToken;)V
    .registers 3
    .parameter "window"

    .prologue
    .line 5821
    iget-boolean v0, p1, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    if-nez v0, :cond_a

    .line 5826
    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    .line 5827
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputWindowsLw()V

    .line 5829
    :cond_a
    return-void
.end method

.method public resumeDispatchingLw(Lcom/android/server/WindowManagerService$WindowToken;)V
    .registers 3
    .parameter "window"

    .prologue
    .line 5832
    iget-boolean v0, p1, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    if-eqz v0, :cond_a

    .line 5837
    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    .line 5838
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputWindowsLw()V

    .line 5840
    :cond_a
    return-void
.end method

.method public setEventDispatchingLw(Z)V
    .registers 5
    .parameter "enabled"

    .prologue
    .line 5865
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchEnabled:Z

    if-eq v0, p1, :cond_21

    .line 5867
    const-string v0, "WindowManagerService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting event dispatching to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 5870
    iput-boolean p1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchEnabled:Z

    .line 5871
    invoke-direct {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputDispatchModeLw()V

    .line 5873
    :cond_21
    return-void
.end method

.method public setFocusedAppLw(Lcom/android/server/WindowManagerService$AppWindowToken;)V
    .registers 5
    .parameter "newApp"

    .prologue
    .line 5808
    if-nez p1, :cond_b

    .line 5809
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputManager:Lcom/android/server/InputManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/server/InputManager;->setFocusedApplication(Lcom/android/server/InputApplication;)V

    .line 5818
    :goto_a
    return-void

    .line 5811
    :cond_b
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputApplication:Lcom/android/server/InputApplication;

    invoke-virtual {p1}, Lcom/android/server/WindowManagerService$AppWindowToken;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/server/InputApplication;->name:Ljava/lang/String;

    .line 5812
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputApplication:Lcom/android/server/InputApplication;

    iget-wide v1, p1, Lcom/android/server/WindowManagerService$AppWindowToken;->inputDispatchingTimeoutNanos:J

    iput-wide v1, v0, Lcom/android/server/InputApplication;->dispatchingTimeoutNanos:J

    .line 5814
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputApplication:Lcom/android/server/InputApplication;

    iput-object p1, v0, Lcom/android/server/InputApplication;->token:Ljava/lang/Object;

    .line 5816
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mInputManager:Lcom/android/server/InputManager;

    iget-object v1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputApplication:Lcom/android/server/InputApplication;

    invoke-virtual {v0, v1}, Lcom/android/server/InputManager;->setFocusedApplication(Lcom/android/server/InputApplication;)V

    goto :goto_a
.end method

.method public setInputFocusLw(Lcom/android/server/WindowManagerService$WindowState;)V
    .registers 4
    .parameter "newWindow"

    .prologue
    .line 5667
    iget-object v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputFocus:Lcom/android/server/WindowManagerService$WindowState;

    if-eq p1, v0, :cond_16

    .line 5668
    if-eqz p1, :cond_11

    invoke-virtual {p1}, Lcom/android/server/WindowManagerService$WindowState;->canReceiveKeys()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 5672
    iget-object v0, p1, Lcom/android/server/WindowManagerService$WindowState;->mToken:Lcom/android/server/WindowManagerService$WindowToken;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    .line 5675
    :cond_11
    iput-object p1, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputFocus:Lcom/android/server/WindowManagerService$WindowState;

    .line 5676
    invoke-virtual {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputWindowsLw()V

    .line 5678
    :cond_16
    return-void
.end method

.method public thawInputDispatchingLw()V
    .registers 2

    .prologue
    .line 5854
    iget-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchFrozen:Z

    if-eqz v0, :cond_a

    .line 5859
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputDispatchFrozen:Z

    .line 5860
    invoke-direct {p0}, Lcom/android/server/WindowManagerService$InputMonitor;->updateInputDispatchModeLw()V

    .line 5862
    :cond_a
    return-void
.end method

.method public updateInputWindowsLw()V
    .registers 16

    .prologue
    .line 5551
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v12, v13, Lcom/android/server/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    .line 5552
    .local v12, windows:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/WindowManagerService$WindowState;>;"
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 5553
    .local v0, N:I
    const/4 v13, 0x1

    sub-int v6, v0, v13

    .local v6, i:I
    :goto_b
    if-ltz v6, :cond_101

    .line 5554
    invoke-virtual {v12, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/WindowManagerService$WindowState;

    .line 5555
    .local v1, child:Lcom/android/server/WindowManagerService$WindowState;
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mInputChannel:Landroid/view/InputChannel;

    if-eqz v13, :cond_1b

    iget-boolean v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mRemoved:Z

    if-eqz v13, :cond_1e

    .line 5553
    :cond_1b
    :goto_1b
    add-int/lit8 v6, v6, -0x1

    goto :goto_b

    .line 5560
    :cond_1e
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v2, v13, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 5561
    .local v2, flags:I
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mAttrs:Landroid/view/WindowManager$LayoutParams;

    iget v10, v13, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 5563
    .local v10, type:I
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mInputFocus:Lcom/android/server/WindowManagerService$WindowState;

    if-ne v1, v13, :cond_b7

    const/4 v13, 0x1

    move v4, v13

    .line 5564
    .local v4, hasFocus:Z
    :goto_2c
    invoke-virtual {v1}, Lcom/android/server/WindowManagerService$WindowState;->isVisibleLw()Z

    move-result v9

    .line 5565
    .local v9, isVisible:Z
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v13, v13, Lcom/android/server/WindowManagerService;->mWallpaperTarget:Lcom/android/server/WindowManagerService$WindowState;

    if-ne v1, v13, :cond_bb

    const/16 v13, 0x7d4

    if-eq v10, v13, :cond_bb

    const/4 v13, 0x1

    move v5, v13

    .line 5569
    .local v5, hasWallpaper:Z
    :goto_3c
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputWindows:Lcom/android/server/InputWindowList;

    invoke-virtual {v13}, Lcom/android/server/InputWindowList;->add()Lcom/android/server/InputWindow;

    move-result-object v7

    .line 5570
    .local v7, inputWindow:Lcom/android/server/InputWindow;
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mInputChannel:Landroid/view/InputChannel;

    iput-object v13, v7, Lcom/android/server/InputWindow;->inputChannel:Landroid/view/InputChannel;

    .line 5571
    invoke-virtual {v1}, Lcom/android/server/WindowManagerService$WindowState;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v7, Lcom/android/server/InputWindow;->name:Ljava/lang/String;

    .line 5572
    iput v2, v7, Lcom/android/server/InputWindow;->layoutParamsFlags:I

    .line 5573
    iput v10, v7, Lcom/android/server/InputWindow;->layoutParamsType:I

    .line 5574
    invoke-virtual {v1}, Lcom/android/server/WindowManagerService$WindowState;->getInputDispatchingTimeoutNanos()J

    move-result-wide v13

    iput-wide v13, v7, Lcom/android/server/InputWindow;->dispatchingTimeoutNanos:J

    .line 5575
    iput-boolean v9, v7, Lcom/android/server/InputWindow;->visible:Z

    .line 5576
    invoke-virtual {v1}, Lcom/android/server/WindowManagerService$WindowState;->canReceiveKeys()Z

    move-result v13

    iput-boolean v13, v7, Lcom/android/server/InputWindow;->canReceiveKeys:Z

    .line 5577
    iput-boolean v4, v7, Lcom/android/server/InputWindow;->hasFocus:Z

    .line 5578
    iput-boolean v5, v7, Lcom/android/server/InputWindow;->hasWallpaper:Z

    .line 5579
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mAppToken:Lcom/android/server/WindowManagerService$AppWindowToken;

    if-eqz v13, :cond_bf

    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mAppToken:Lcom/android/server/WindowManagerService$AppWindowToken;

    iget-boolean v13, v13, Lcom/android/server/WindowManagerService$WindowToken;->paused:Z

    :goto_6a
    iput-boolean v13, v7, Lcom/android/server/InputWindow;->paused:Z

    .line 5580
    iget v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mLayer:I

    iput v13, v7, Lcom/android/server/InputWindow;->layer:I

    .line 5581
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mSession:Lcom/android/server/WindowManagerService$Session;

    iget v13, v13, Lcom/android/server/WindowManagerService$Session;->mPid:I

    iput v13, v7, Lcom/android/server/InputWindow;->ownerPid:I

    .line 5582
    iget-object v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mSession:Lcom/android/server/WindowManagerService$Session;

    iget v13, v13, Lcom/android/server/WindowManagerService$Session;->mUid:I

    iput v13, v7, Lcom/android/server/InputWindow;->ownerUid:I

    .line 5584
    iget-object v3, v1, Lcom/android/server/WindowManagerService$WindowState;->mFrame:Landroid/graphics/Rect;

    .line 5585
    .local v3, frame:Landroid/graphics/Rect;
    iget v13, v3, Landroid/graphics/Rect;->left:I

    iput v13, v7, Lcom/android/server/InputWindow;->frameLeft:I

    .line 5586
    iget v13, v3, Landroid/graphics/Rect;->top:I

    iput v13, v7, Lcom/android/server/InputWindow;->frameTop:I

    .line 5587
    iget v13, v3, Landroid/graphics/Rect;->right:I

    iput v13, v7, Lcom/android/server/InputWindow;->frameRight:I

    .line 5588
    iget v13, v3, Landroid/graphics/Rect;->bottom:I

    iput v13, v7, Lcom/android/server/InputWindow;->frameBottom:I

    .line 5590
    iget-object v11, v1, Lcom/android/server/WindowManagerService$WindowState;->mVisibleFrame:Landroid/graphics/Rect;

    .line 5591
    .local v11, visibleFrame:Landroid/graphics/Rect;
    iget v13, v11, Landroid/graphics/Rect;->left:I

    iput v13, v7, Lcom/android/server/InputWindow;->visibleFrameLeft:I

    .line 5592
    iget v13, v11, Landroid/graphics/Rect;->top:I

    iput v13, v7, Lcom/android/server/InputWindow;->visibleFrameTop:I

    .line 5593
    iget v13, v11, Landroid/graphics/Rect;->right:I

    iput v13, v7, Lcom/android/server/InputWindow;->visibleFrameRight:I

    .line 5594
    iget v13, v11, Landroid/graphics/Rect;->bottom:I

    iput v13, v7, Lcom/android/server/InputWindow;->visibleFrameBottom:I

    .line 5596
    iget v13, v1, Lcom/android/server/WindowManagerService$WindowState;->mTouchableInsets:I

    packed-switch v13, :pswitch_data_114

    .line 5599
    iget v13, v3, Landroid/graphics/Rect;->left:I

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaLeft:I

    .line 5600
    iget v13, v3, Landroid/graphics/Rect;->top:I

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaTop:I

    .line 5601
    iget v13, v3, Landroid/graphics/Rect;->right:I

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaRight:I

    .line 5602
    iget v13, v3, Landroid/graphics/Rect;->bottom:I

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaBottom:I

    goto/16 :goto_1b

    .line 5563
    .end local v3           #frame:Landroid/graphics/Rect;
    .end local v4           #hasFocus:Z
    .end local v5           #hasWallpaper:Z
    .end local v7           #inputWindow:Lcom/android/server/InputWindow;
    .end local v9           #isVisible:Z
    .end local v11           #visibleFrame:Landroid/graphics/Rect;
    :cond_b7
    const/4 v13, 0x0

    move v4, v13

    goto/16 :goto_2c

    .line 5565
    .restart local v4       #hasFocus:Z
    .restart local v9       #isVisible:Z
    :cond_bb
    const/4 v13, 0x0

    move v5, v13

    goto/16 :goto_3c

    .line 5579
    .restart local v5       #hasWallpaper:Z
    .restart local v7       #inputWindow:Lcom/android/server/InputWindow;
    :cond_bf
    const/4 v13, 0x0

    goto :goto_6a

    .line 5606
    .restart local v3       #frame:Landroid/graphics/Rect;
    .restart local v11       #visibleFrame:Landroid/graphics/Rect;
    :pswitch_c1
    iget-object v8, v1, Lcom/android/server/WindowManagerService$WindowState;->mGivenContentInsets:Landroid/graphics/Rect;

    .line 5607
    .local v8, inset:Landroid/graphics/Rect;
    iget v13, v3, Landroid/graphics/Rect;->left:I

    iget v14, v8, Landroid/graphics/Rect;->left:I

    add-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaLeft:I

    .line 5608
    iget v13, v3, Landroid/graphics/Rect;->top:I

    iget v14, v8, Landroid/graphics/Rect;->top:I

    add-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaTop:I

    .line 5609
    iget v13, v3, Landroid/graphics/Rect;->right:I

    iget v14, v8, Landroid/graphics/Rect;->right:I

    sub-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaRight:I

    .line 5610
    iget v13, v3, Landroid/graphics/Rect;->bottom:I

    iget v14, v8, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaBottom:I

    goto/16 :goto_1b

    .line 5615
    .end local v8           #inset:Landroid/graphics/Rect;
    :pswitch_e1
    iget-object v8, v1, Lcom/android/server/WindowManagerService$WindowState;->mGivenVisibleInsets:Landroid/graphics/Rect;

    .line 5616
    .restart local v8       #inset:Landroid/graphics/Rect;
    iget v13, v3, Landroid/graphics/Rect;->left:I

    iget v14, v8, Landroid/graphics/Rect;->left:I

    add-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaLeft:I

    .line 5617
    iget v13, v3, Landroid/graphics/Rect;->top:I

    iget v14, v8, Landroid/graphics/Rect;->top:I

    add-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaTop:I

    .line 5618
    iget v13, v3, Landroid/graphics/Rect;->right:I

    iget v14, v8, Landroid/graphics/Rect;->right:I

    sub-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaRight:I

    .line 5619
    iget v13, v3, Landroid/graphics/Rect;->bottom:I

    iget v14, v8, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v13, v14

    iput v13, v7, Lcom/android/server/InputWindow;->touchableAreaBottom:I

    goto/16 :goto_1b

    .line 5626
    .end local v1           #child:Lcom/android/server/WindowManagerService$WindowState;
    .end local v2           #flags:I
    .end local v3           #frame:Landroid/graphics/Rect;
    .end local v4           #hasFocus:Z
    .end local v5           #hasWallpaper:Z
    .end local v7           #inputWindow:Lcom/android/server/InputWindow;
    .end local v8           #inset:Landroid/graphics/Rect;
    .end local v9           #isVisible:Z
    .end local v10           #type:I
    .end local v11           #visibleFrame:Landroid/graphics/Rect;
    :cond_101
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->this$0:Lcom/android/server/WindowManagerService;

    iget-object v13, v13, Lcom/android/server/WindowManagerService;->mInputManager:Lcom/android/server/InputManager;

    iget-object v14, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputWindows:Lcom/android/server/InputWindowList;

    invoke-virtual {v14}, Lcom/android/server/InputWindowList;->toNullTerminatedArray()[Lcom/android/server/InputWindow;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/android/server/InputManager;->setInputWindows([Lcom/android/server/InputWindow;)V

    .line 5630
    iget-object v13, p0, Lcom/android/server/WindowManagerService$InputMonitor;->mTempInputWindows:Lcom/android/server/InputWindowList;

    invoke-virtual {v13}, Lcom/android/server/InputWindowList;->clear()V

    .line 5631
    return-void

    .line 5596
    :pswitch_data_114
    .packed-switch 0x1
        :pswitch_c1
        :pswitch_e1
    .end packed-switch
.end method
