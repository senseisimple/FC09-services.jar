.class final Lcom/android/server/WindowManagerService$H;
.super Landroid/os/Handler;
.source "WindowManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/WindowManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "H"
.end annotation


# static fields
.field public static final ADD_STARTING:I = 0x5

.field public static final ANIMATE:I = 0x4

.field public static final APP_FREEZE_TIMEOUT:I = 0x11

.field public static final APP_TRANSITION_TIMEOUT:I = 0xd

.field public static final ENABLE_SCREEN:I = 0x10

.field public static final FINISHED_STARTING:I = 0x7

.field public static final FORCE_GC:I = 0xf

.field public static final HOLD_SCREEN_CHANGED:I = 0xc

.field public static final PERSIST_ANIMATION_SCALE:I = 0xe

.field public static final REMOVE_STARTING:I = 0x6

.field public static final REPORT_APPLICATION_TOKEN_WINDOWS:I = 0x8

.field public static final REPORT_FOCUS_CHANGE:I = 0x2

.field public static final REPORT_LOSING_FOCUS:I = 0x3

.field public static final REPORT_WINDOWS_CHANGE:I = 0x13

.field public static final SEND_NEW_CONFIGURATION:I = 0x12

.field public static final WINDOW_FREEZE_TIMEOUT:I = 0xb


# instance fields
.field private mLastReportedHold:Lcom/android/server/WindowManagerService$Session;

.field final synthetic this$0:Lcom/android/server/WindowManagerService;


# direct methods
.method public constructor <init>(Lcom/android/server/WindowManagerService;)V
    .registers 2
    .parameter

    .prologue
    .line 8324
    iput-object p1, p0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 8325
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 30
    .parameter "msg"

    .prologue
    .line 8329
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move v4, v0

    packed-switch v4, :pswitch_data_49e

    .line 8664
    .end local p1
    :cond_8
    :goto_8
    :pswitch_8
    return-void

    .line 8334
    .restart local p1
    :pswitch_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8335
    :try_start_11
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v15, v5, Lcom/android/server/WindowManagerService;->mLastFocus:Lcom/android/server/WindowManagerService$WindowState;

    .line 8336
    .local v15, lastFocus:Lcom/android/server/WindowManagerService$WindowState;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    move-object v0, v5

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mCurrentFocus:Lcom/android/server/WindowManagerService$WindowState;

    move-object/from16 v17, v0

    .line 8337
    .local v17, newFocus:Lcom/android/server/WindowManagerService$WindowState;
    move-object v0, v15

    move-object/from16 v1, v17

    if-ne v0, v1, :cond_2c

    .line 8339
    monitor-exit v4

    goto :goto_8

    .line 8350
    .end local v15           #lastFocus:Lcom/android/server/WindowManagerService$WindowState;
    .end local v17           #newFocus:Lcom/android/server/WindowManagerService$WindowState;
    :catchall_29
    move-exception v5

    monitor-exit v4
    :try_end_2b
    .catchall {:try_start_11 .. :try_end_2b} :catchall_29

    throw v5

    .line 8341
    .restart local v15       #lastFocus:Lcom/android/server/WindowManagerService$WindowState;
    .restart local v17       #newFocus:Lcom/android/server/WindowManagerService$WindowState;
    :cond_2c
    :try_start_2c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    move-object/from16 v0, v17

    move-object v1, v5

    iput-object v0, v1, Lcom/android/server/WindowManagerService;->mLastFocus:Lcom/android/server/WindowManagerService$WindowState;

    .line 8344
    if-eqz v17, :cond_4b

    if-eqz v15, :cond_4b

    invoke-virtual/range {v17 .. v17}, Lcom/android/server/WindowManagerService$WindowState;->isDisplayedLw()Z

    move-result v5

    if-nez v5, :cond_4b

    .line 8347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    invoke-virtual {v5, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8348
    const/4 v15, 0x0

    .line 8350
    :cond_4b
    monitor-exit v4
    :try_end_4c
    .catchall {:try_start_2c .. :try_end_4c} :catchall_29

    .line 8352
    move-object v0, v15

    move-object/from16 v1, v17

    if-eq v0, v1, :cond_8

    .line 8355
    if-eqz v17, :cond_6b

    .line 8358
    :try_start_53
    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowState;->mClient:Landroid/view/IWindow;

    move-object v4, v0

    const/4 v5, 0x1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget-boolean v6, v6, Lcom/android/server/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v4, v5, v6}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_63
    .catch Landroid/os/RemoteException; {:try_start_53 .. :try_end_63} :catch_49a

    .line 8362
    :goto_63
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    #calls: Lcom/android/server/WindowManagerService;->notifyFocusChanged()V
    invoke-static {v4}, Lcom/android/server/WindowManagerService;->access$1200(Lcom/android/server/WindowManagerService;)V

    .line 8365
    :cond_6b
    if-eqz v15, :cond_8

    .line 8368
    :try_start_6d
    iget-object v4, v15, Lcom/android/server/WindowManagerService$WindowState;->mClient:Landroid/view/IWindow;

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget-boolean v6, v6, Lcom/android/server/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v4, v5, v6}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_7a
    .catch Landroid/os/RemoteException; {:try_start_6d .. :try_end_7a} :catch_7b

    goto :goto_8

    .line 8369
    :catch_7b
    move-exception v4

    goto :goto_8

    .line 8379
    .end local v15           #lastFocus:Lcom/android/server/WindowManagerService$WindowState;
    .end local v17           #newFocus:Lcom/android/server/WindowManagerService$WindowState;
    :pswitch_7d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8380
    :try_start_85
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    move-object v0, v5

    iget-object v0, v0, Lcom/android/server/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    move-object/from16 v16, v0

    .line 8381
    .local v16, losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/WindowManagerService$WindowState;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v5, Lcom/android/server/WindowManagerService;->mLosingFocus:Ljava/util/ArrayList;

    .line 8382
    monitor-exit v4
    :try_end_9c
    .catchall {:try_start_85 .. :try_end_9c} :catchall_bf

    .line 8384
    invoke-virtual/range {v16 .. v16}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 8385
    .local v11, N:I
    const/4 v14, 0x0

    .end local p1
    .local v14, i:I
    :goto_a1
    if-ge v14, v11, :cond_8

    .line 8388
    :try_start_a3
    move-object/from16 v0, v16

    move v1, v14

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/android/server/WindowManagerService$WindowState;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowState;->mClient:Landroid/view/IWindow;

    move-object v4, v0

    const/4 v5, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget-boolean v6, v6, Lcom/android/server/WindowManagerService;->mInTouchMode:Z

    invoke-interface {v4, v5, v6}, Landroid/view/IWindow;->windowFocusChanged(ZZ)V
    :try_end_bc
    .catch Landroid/os/RemoteException; {:try_start_a3 .. :try_end_bc} :catch_497

    .line 8385
    :goto_bc
    add-int/lit8 v14, v14, 0x1

    goto :goto_a1

    .line 8382
    .end local v11           #N:I
    .end local v14           #i:I
    .end local v16           #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/WindowManagerService$WindowState;>;"
    .restart local p1
    :catchall_bf
    move-exception v5

    :try_start_c0
    monitor-exit v4
    :try_end_c1
    .catchall {:try_start_c0 .. :try_end_c1} :catchall_bf

    throw v5

    .line 8396
    :pswitch_c2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8397
    :try_start_ca
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/android/server/WindowManagerService;->mAnimationPending:Z

    .line 8398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    #calls: Lcom/android/server/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v5}, Lcom/android/server/WindowManagerService;->access$1300(Lcom/android/server/WindowManagerService;)V

    .line 8399
    monitor-exit v4

    goto/16 :goto_8

    :catchall_dd
    move-exception v5

    monitor-exit v4
    :try_end_df
    .catchall {:try_start_ca .. :try_end_df} :catchall_dd

    throw v5

    .line 8403
    :pswitch_e0
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v27, v0

    check-cast v27, Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 8404
    .local v27, wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    move-object/from16 v22, v0

    .line 8406
    .local v22, sd:Lcom/android/server/WindowManagerService$StartingData;
    if-eqz v22, :cond_8

    .line 8414
    const/16 v25, 0x0

    .line 8416
    .local v25, view:Landroid/view/View;
    :try_start_f2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowToken;->token:Landroid/os/IBinder;

    move-object v5, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/WindowManagerService$StartingData;->pkg:Ljava/lang/String;

    move-object v6, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/WindowManagerService$StartingData;->theme:I

    move v7, v0

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/server/WindowManagerService$StartingData;->nonLocalizedLabel:Ljava/lang/CharSequence;

    move-object v8, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/WindowManagerService$StartingData;->labelRes:I

    move v9, v0

    move-object/from16 v0, v22

    iget v0, v0, Lcom/android/server/WindowManagerService$StartingData;->icon:I

    move v10, v0

    invoke-interface/range {v4 .. v10}, Landroid/view/WindowManagerPolicy;->addStartingWindow(Landroid/os/IBinder;Ljava/lang/String;ILjava/lang/CharSequence;II)Landroid/view/View;
    :try_end_11a
    .catch Ljava/lang/Exception; {:try_start_f2 .. :try_end_11a} :catch_16b

    move-result-object v25

    .line 8424
    :goto_11b
    if-eqz v25, :cond_8

    .line 8425
    const/4 v12, 0x0

    .line 8427
    .local v12, abort:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8428
    :try_start_126
    move-object/from16 v0, v27

    iget-boolean v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->removed:Z

    move v5, v0

    if-nez v5, :cond_134

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    move-object v5, v0

    if-nez v5, :cond_175

    .line 8431
    :cond_134
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    move-object v5, v0

    if-eqz v5, :cond_148

    .line 8436
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    .line 8437
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    .line 8438
    const/4 v12, 0x1

    .line 8448
    :cond_148
    :goto_148
    monitor-exit v4
    :try_end_149
    .catchall {:try_start_126 .. :try_end_149} :catchall_17c

    .line 8450
    if-eqz v12, :cond_8

    .line 8452
    :try_start_14b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowToken;->token:Landroid/os/IBinder;

    move-object v5, v0

    move-object v0, v4

    move-object v1, v5

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_15e
    .catch Ljava/lang/Exception; {:try_start_14b .. :try_end_15e} :catch_160

    goto/16 :goto_8

    .line 8453
    :catch_160
    move-exception v4

    move-object v13, v4

    .line 8454
    .local v13, e:Ljava/lang/Exception;
    const-string v4, "WindowManagerService"

    const-string v5, "Exception when removing starting window"

    invoke-static {v4, v5, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_8

    .line 8420
    .end local v12           #abort:Z
    .end local v13           #e:Ljava/lang/Exception;
    :catch_16b
    move-exception v4

    move-object v13, v4

    .line 8421
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v4, "WindowManagerService"

    const-string v5, "Exception when adding starting window"

    invoke-static {v4, v5, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_11b

    .line 8441
    .end local v13           #e:Ljava/lang/Exception;
    .restart local v12       #abort:Z
    :cond_175
    :try_start_175
    move-object/from16 v0, v25

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    goto :goto_148

    .line 8448
    :catchall_17c
    move-exception v5

    monitor-exit v4
    :try_end_17e
    .catchall {:try_start_175 .. :try_end_17e} :catchall_17c

    throw v5

    .line 8461
    .end local v12           #abort:Z
    .end local v22           #sd:Lcom/android/server/WindowManagerService$StartingData;
    .end local v25           #view:Landroid/view/View;
    .end local v27           #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    :pswitch_17f
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v27, v0

    check-cast v27, Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 8462
    .restart local v27       #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    const/16 v24, 0x0

    .line 8463
    .local v24, token:Landroid/os/IBinder;
    const/16 v25, 0x0

    .line 8464
    .restart local v25       #view:Landroid/view/View;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8469
    :try_start_193
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    move-object v5, v0

    if-eqz v5, :cond_1b8

    .line 8470
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    move-object/from16 v25, v0

    .line 8471
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v24, v0

    .line 8472
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    .line 8473
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    .line 8474
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    .line 8476
    :cond_1b8
    monitor-exit v4
    :try_end_1b9
    .catchall {:try_start_193 .. :try_end_1b9} :catchall_1d7

    .line 8477
    if-eqz v25, :cond_8

    .line 8479
    :try_start_1bb
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object v0, v4

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_1ca
    .catch Ljava/lang/Exception; {:try_start_1bb .. :try_end_1ca} :catch_1cc

    goto/16 :goto_8

    .line 8480
    :catch_1cc
    move-exception v4

    move-object v13, v4

    .line 8481
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v4, "WindowManagerService"

    const-string v5, "Exception when removing starting window"

    invoke-static {v4, v5, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_8

    .line 8476
    .end local v13           #e:Ljava/lang/Exception;
    :catchall_1d7
    move-exception v5

    :try_start_1d8
    monitor-exit v4
    :try_end_1d9
    .catchall {:try_start_1d8 .. :try_end_1d9} :catchall_1d7

    throw v5

    .line 8487
    .end local v24           #token:Landroid/os/IBinder;
    .end local v25           #view:Landroid/view/View;
    .end local v27           #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    :pswitch_1da
    const/16 v24, 0x0

    .line 8488
    .restart local v24       #token:Landroid/os/IBinder;
    const/16 v25, 0x0

    .line 8490
    .restart local v25       #view:Landroid/view/View;
    :goto_1de
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8491
    :try_start_1e6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v11

    .line 8492
    .restart local v11       #N:I
    if-gtz v11, :cond_1f9

    .line 8493
    monitor-exit v4

    goto/16 :goto_8

    .line 8511
    .end local v11           #N:I
    :catchall_1f6
    move-exception v5

    monitor-exit v4
    :try_end_1f8
    .catchall {:try_start_1e6 .. :try_end_1f8} :catchall_1f6

    throw v5

    .line 8495
    .restart local v11       #N:I
    :cond_1f9
    :try_start_1f9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mFinishedStarting:Ljava/util/ArrayList;

    const/4 v6, 0x1

    sub-int v6, v11, v6

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 8502
    .restart local v27       #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    move-object v5, v0

    if-nez v5, :cond_212

    .line 8503
    monitor-exit v4

    goto :goto_1de

    .line 8506
    :cond_212
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    move-object/from16 v25, v0

    .line 8507
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$WindowToken;->token:Landroid/os/IBinder;

    move-object/from16 v24, v0

    .line 8508
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingData:Lcom/android/server/WindowManagerService$StartingData;

    .line 8509
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingView:Landroid/view/View;

    .line 8510
    const/4 v5, 0x0

    move-object v0, v5

    move-object/from16 v1, v27

    iput-object v0, v1, Lcom/android/server/WindowManagerService$AppWindowToken;->startingWindow:Lcom/android/server/WindowManagerService$WindowState;

    .line 8511
    monitor-exit v4
    :try_end_231
    .catchall {:try_start_1f9 .. :try_end_231} :catchall_1f6

    .line 8514
    :try_start_231
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mPolicy:Landroid/view/WindowManagerPolicy;

    move-object v0, v4

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManagerPolicy;->removeStartingWindow(Landroid/os/IBinder;Landroid/view/View;)V
    :try_end_240
    .catch Ljava/lang/Exception; {:try_start_231 .. :try_end_240} :catch_241

    goto :goto_1de

    .line 8515
    :catch_241
    move-exception v4

    move-object v13, v4

    .line 8516
    .restart local v13       #e:Ljava/lang/Exception;
    const-string v4, "WindowManagerService"

    const-string v5, "Exception when removing starting window"

    invoke-static {v4, v5, v13}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1de

    .line 8522
    .end local v11           #N:I
    .end local v13           #e:Ljava/lang/Exception;
    .end local v24           #token:Landroid/os/IBinder;
    .end local v25           #view:Landroid/view/View;
    .end local v27           #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    :pswitch_24b
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v27, v0

    check-cast v27, Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 8524
    .restart local v27       #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move v4, v0

    if-eqz v4, :cond_276

    const/4 v4, 0x1

    move/from16 v20, v4

    .line 8525
    .local v20, nowVisible:Z
    :goto_25d
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg2:I

    move v4, v0

    if-eqz v4, :cond_27a

    const/4 v4, 0x1

    move/from16 v19, v4

    .line 8532
    .local v19, nowGone:Z
    :goto_267
    if-eqz v20, :cond_27e

    .line 8533
    :try_start_269
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    move-object v4, v0

    invoke-interface {v4}, Landroid/view/IApplicationToken;->windowsVisible()V

    goto/16 :goto_8

    .line 8537
    :catch_273
    move-exception v4

    goto/16 :goto_8

    .line 8524
    .end local v19           #nowGone:Z
    .end local v20           #nowVisible:Z
    :cond_276
    const/4 v4, 0x0

    move/from16 v20, v4

    goto :goto_25d

    .line 8525
    .restart local v20       #nowVisible:Z
    :cond_27a
    const/4 v4, 0x0

    move/from16 v19, v4

    goto :goto_267

    .line 8535
    .restart local v19       #nowGone:Z
    :cond_27e
    move-object/from16 v0, v27

    iget-object v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->appToken:Landroid/view/IApplicationToken;

    move-object v4, v0

    invoke-interface {v4}, Landroid/view/IApplicationToken;->windowsGone()V
    :try_end_286
    .catch Landroid/os/RemoteException; {:try_start_269 .. :try_end_286} :catch_273

    goto/16 :goto_8

    .line 8542
    .end local v19           #nowGone:Z
    .end local v20           #nowVisible:Z
    .end local v27           #wtoken:Lcom/android/server/WindowManagerService$AppWindowToken;
    :pswitch_288
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8543
    :try_start_290
    const-string v5, "WindowManagerService"

    const-string v6, "Window freeze timeout expired."

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8544
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 8545
    .restart local v14       #i:I
    :cond_2a2
    :goto_2a2
    if-lez v14, :cond_2df

    .line 8546
    add-int/lit8 v14, v14, -0x1

    .line 8547
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mWindows:Ljava/util/ArrayList;

    invoke-virtual {v5, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/android/server/WindowManagerService$WindowState;

    .line 8548
    .local v26, w:Lcom/android/server/WindowManagerService$WindowState;
    move-object/from16 v0, v26

    iget-boolean v0, v0, Lcom/android/server/WindowManagerService$WindowState;->mOrientationChanging:Z

    move v5, v0

    if-eqz v5, :cond_2a2

    .line 8549
    const/4 v5, 0x0

    move v0, v5

    move-object/from16 v1, v26

    iput-boolean v0, v1, Lcom/android/server/WindowManagerService$WindowState;->mOrientationChanging:Z

    .line 8550
    const-string v5, "WindowManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Force clearing orientation change: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object v0, v6

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2a2

    .line 8554
    .end local v14           #i:I
    .end local v26           #w:Lcom/android/server/WindowManagerService$WindowState;
    :catchall_2dc
    move-exception v5

    monitor-exit v4
    :try_end_2de
    .catchall {:try_start_290 .. :try_end_2de} :catchall_2dc

    throw v5

    .line 8553
    .restart local v14       #i:I
    :cond_2df
    :try_start_2df
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    #calls: Lcom/android/server/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v5}, Lcom/android/server/WindowManagerService;->access$1300(Lcom/android/server/WindowManagerService;)V

    .line 8554
    monitor-exit v4
    :try_end_2e8
    .catchall {:try_start_2df .. :try_end_2e8} :catchall_2dc

    goto/16 :goto_8

    .line 8561
    .end local v14           #i:I
    :pswitch_2ea
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8562
    :try_start_2f2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->mLastReportedHold:Lcom/android/server/WindowManagerService$Session;

    move-object/from16 v21, v0

    .line 8563
    .local v21, oldHold:Lcom/android/server/WindowManagerService$Session;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Lcom/android/server/WindowManagerService$Session;

    .line 8564
    .local v18, newHold:Lcom/android/server/WindowManagerService$Session;
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/server/WindowManagerService$H;->mLastReportedHold:Lcom/android/server/WindowManagerService$Session;

    .line 8565
    monitor-exit v4
    :try_end_307
    .catchall {:try_start_2f2 .. :try_end_307} :catchall_33c

    .line 8567
    move-object/from16 v0, v21

    move-object/from16 v1, v18

    if-eq v0, v1, :cond_8

    .line 8569
    if-eqz v21, :cond_322

    .line 8570
    :try_start_30f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v0, v21

    iget v0, v0, Lcom/android/server/WindowManagerService$Session;->mUid:I

    move v5, v0

    const/4 v6, -0x1

    const-string v7, "window"

    const/4 v8, 0x2

    invoke-interface {v4, v5, v6, v7, v8}, Lcom/android/internal/app/IBatteryStats;->noteStopWakelock(IILjava/lang/String;I)V

    .line 8574
    :cond_322
    if-eqz v18, :cond_8

    .line 8575
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mBatteryStats:Lcom/android/internal/app/IBatteryStats;

    move-object/from16 v0, v18

    iget v0, v0, Lcom/android/server/WindowManagerService$Session;->mUid:I

    move v5, v0

    const/4 v6, -0x1

    const-string v7, "window"

    const/4 v8, 0x2

    invoke-interface {v4, v5, v6, v7, v8}, Lcom/android/internal/app/IBatteryStats;->noteStartWakelock(IILjava/lang/String;I)V
    :try_end_337
    .catch Landroid/os/RemoteException; {:try_start_30f .. :try_end_337} :catch_339

    goto/16 :goto_8

    .line 8579
    :catch_339
    move-exception v4

    goto/16 :goto_8

    .line 8565
    .end local v18           #newHold:Lcom/android/server/WindowManagerService$Session;
    .end local v21           #oldHold:Lcom/android/server/WindowManagerService$Session;
    :catchall_33c
    move-exception v5

    :try_start_33d
    monitor-exit v4
    :try_end_33e
    .catchall {:try_start_33d .. :try_end_33e} :catchall_33c

    throw v5

    .line 8586
    :pswitch_33f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8587
    :try_start_347
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget v5, v5, Lcom/android/server/WindowManagerService;->mNextAppTransition:I

    const/4 v6, -0x1

    if-eq v5, v6, :cond_369

    .line 8590
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const/4 v6, 0x1

    iput-boolean v6, v5, Lcom/android/server/WindowManagerService;->mAppTransitionReady:Z

    .line 8591
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const/4 v6, 0x1

    iput-boolean v6, v5, Lcom/android/server/WindowManagerService;->mAppTransitionTimeout:Z

    .line 8592
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    #calls: Lcom/android/server/WindowManagerService;->performLayoutAndPlaceSurfacesLocked()V
    invoke-static {v5}, Lcom/android/server/WindowManagerService;->access$1300(Lcom/android/server/WindowManagerService;)V

    .line 8594
    :cond_369
    monitor-exit v4

    goto/16 :goto_8

    :catchall_36c
    move-exception v5

    monitor-exit v4
    :try_end_36e
    .catchall {:try_start_347 .. :try_end_36e} :catchall_36c

    throw v5

    .line 8599
    :pswitch_36f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "window_animation_scale"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget v6, v6, Lcom/android/server/WindowManagerService;->mWindowAnimationScale:F

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    .line 8601
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "transition_animation_scale"

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget v6, v6, Lcom/android/server/WindowManagerService;->mTransitionAnimationScale:F

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->putFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)Z

    goto/16 :goto_8

    .line 8607
    :pswitch_39f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8608
    :try_start_3a7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-boolean v5, v5, Lcom/android/server/WindowManagerService;->mAnimationPending:Z

    if-eqz v5, :cond_3cf

    .line 8611
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mH:Lcom/android/server/WindowManagerService$H;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v6, v0

    iget-object v6, v6, Lcom/android/server/WindowManagerService;->mH:Lcom/android/server/WindowManagerService$H;

    const/16 v7, 0xf

    invoke-virtual {v6, v7}, Lcom/android/server/WindowManagerService$H;->obtainMessage(I)Landroid/os/Message;

    move-result-object v6

    const-wide/16 v7, 0x7d0

    invoke-virtual {v5, v6, v7, v8}, Lcom/android/server/WindowManagerService$H;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 8613
    monitor-exit v4

    goto/16 :goto_8

    .line 8621
    :catchall_3cc
    move-exception v5

    monitor-exit v4
    :try_end_3ce
    .catchall {:try_start_3a7 .. :try_end_3ce} :catchall_3cc

    throw v5

    .line 8617
    :cond_3cf
    :try_start_3cf
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-boolean v5, v5, Lcom/android/server/WindowManagerService;->mDisplayFrozen:Z

    if-eqz v5, :cond_3db

    .line 8618
    monitor-exit v4

    goto/16 :goto_8

    .line 8620
    :cond_3db
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const-wide/16 v6, 0x0

    iput-wide v6, v5, Lcom/android/server/WindowManagerService;->mFreezeGcPending:J

    .line 8621
    monitor-exit v4
    :try_end_3e5
    .catchall {:try_start_3cf .. :try_end_3e5} :catchall_3cc

    .line 8622
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Runtime;->gc()V

    goto/16 :goto_8

    .line 8627
    :pswitch_3ee
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/android/server/WindowManagerService;->performEnableScreen()V

    goto/16 :goto_8

    .line 8632
    :pswitch_3f8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8633
    :try_start_400
    const-string v5, "WindowManagerService"

    const-string v6, "App freeze timeout expired."

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8634
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 8635
    .restart local v14       #i:I
    :cond_412
    :goto_412
    if-lez v14, :cond_458

    .line 8636
    add-int/lit8 v14, v14, -0x1

    .line 8637
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    iget-object v5, v5, Lcom/android/server/WindowManagerService;->mAppTokens:Ljava/util/ArrayList;

    invoke-virtual {v5, v14}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Lcom/android/server/WindowManagerService$AppWindowToken;

    .line 8638
    .local v23, tok:Lcom/android/server/WindowManagerService$AppWindowToken;
    move-object/from16 v0, v23

    iget-boolean v0, v0, Lcom/android/server/WindowManagerService$AppWindowToken;->freezingScreen:Z

    move v5, v0

    if-eqz v5, :cond_412

    .line 8639
    const-string v5, "WindowManagerService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Force clearing freeze: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object v0, v6

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 8640
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const/4 v6, 0x1

    const/4 v7, 0x1

    move-object v0, v5

    move-object/from16 v1, v23

    move v2, v6

    move v3, v7

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/server/WindowManagerService;->unsetAppFreezingScreenLocked(Lcom/android/server/WindowManagerService$AppWindowToken;ZZ)V

    goto :goto_412

    .line 8643
    .end local v14           #i:I
    .end local v23           #tok:Lcom/android/server/WindowManagerService$AppWindowToken;
    :catchall_455
    move-exception v5

    monitor-exit v4
    :try_end_457
    .catchall {:try_start_400 .. :try_end_457} :catchall_455

    throw v5

    .restart local v14       #i:I
    :cond_458
    :try_start_458
    monitor-exit v4
    :try_end_459
    .catchall {:try_start_458 .. :try_end_459} :catchall_455

    goto/16 :goto_8

    .line 8648
    .end local v14           #i:I
    :pswitch_45b
    const/16 v4, 0x12

    move-object/from16 v0, p0

    move v1, v4

    invoke-virtual {v0, v1}, Lcom/android/server/WindowManagerService$H;->removeMessages(I)V

    .line 8649
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    invoke-virtual {v4}, Lcom/android/server/WindowManagerService;->sendNewConfiguration()V

    goto/16 :goto_8

    .line 8654
    :pswitch_46d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    #getter for: Lcom/android/server/WindowManagerService;->mWindowsChanged:Z
    invoke-static {v4}, Lcom/android/server/WindowManagerService;->access$1400(Lcom/android/server/WindowManagerService;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 8655
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    iget-object v4, v4, Lcom/android/server/WindowManagerService;->mWindowMap:Ljava/util/HashMap;

    monitor-enter v4

    .line 8656
    :try_start_480
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v5, v0

    const/4 v6, 0x0

    #setter for: Lcom/android/server/WindowManagerService;->mWindowsChanged:Z
    invoke-static {v5, v6}, Lcom/android/server/WindowManagerService;->access$1402(Lcom/android/server/WindowManagerService;Z)Z

    .line 8657
    monitor-exit v4
    :try_end_48a
    .catchall {:try_start_480 .. :try_end_48a} :catchall_494

    .line 8658
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/WindowManagerService$H;->this$0:Lcom/android/server/WindowManagerService;

    move-object v4, v0

    #calls: Lcom/android/server/WindowManagerService;->notifyWindowsChanged()V
    invoke-static {v4}, Lcom/android/server/WindowManagerService;->access$1500(Lcom/android/server/WindowManagerService;)V

    goto/16 :goto_8

    .line 8657
    :catchall_494
    move-exception v5

    :try_start_495
    monitor-exit v4
    :try_end_496
    .catchall {:try_start_495 .. :try_end_496} :catchall_494

    throw v5

    .line 8389
    .end local p1
    .restart local v11       #N:I
    .restart local v14       #i:I
    .restart local v16       #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/WindowManagerService$WindowState;>;"
    :catch_497
    move-exception v4

    goto/16 :goto_bc

    .line 8359
    .end local v11           #N:I
    .end local v14           #i:I
    .end local v16           #losers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/WindowManagerService$WindowState;>;"
    .restart local v15       #lastFocus:Lcom/android/server/WindowManagerService$WindowState;
    .restart local v17       #newFocus:Lcom/android/server/WindowManagerService$WindowState;
    .restart local p1
    :catch_49a
    move-exception v4

    goto/16 :goto_63

    .line 8329
    nop

    :pswitch_data_49e
    .packed-switch 0x2
        :pswitch_9
        :pswitch_7d
        :pswitch_c2
        :pswitch_e0
        :pswitch_17f
        :pswitch_1da
        :pswitch_24b
        :pswitch_8
        :pswitch_8
        :pswitch_288
        :pswitch_2ea
        :pswitch_33f
        :pswitch_36f
        :pswitch_39f
        :pswitch_3ee
        :pswitch_3f8
        :pswitch_45b
        :pswitch_46d
    .end packed-switch
.end method
