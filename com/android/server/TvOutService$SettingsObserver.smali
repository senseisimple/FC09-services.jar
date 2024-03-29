.class Lcom/android/server/TvOutService$SettingsObserver;
.super Landroid/database/ContentObserver;
.source "TvOutService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/TvOutService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SettingsObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/TvOutService;


# direct methods
.method constructor <init>(Lcom/android/server/TvOutService;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "handler"

    .prologue
    .line 118
    iput-object p1, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    .line 119
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 120
    return-void
.end method


# virtual methods
.method observe()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 123
    const-string v1, "TvOut-Observer"

    const-string v2, "observe"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    iget-object v1, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #getter for: Lcom/android/server/TvOutService;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/TvOutService;->access$000(Lcom/android/server/TvOutService;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 126
    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "tv_system"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v3, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 128
    const-string v1, "tv_out"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1, v3, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 130
    invoke-virtual {p0}, Lcom/android/server/TvOutService$SettingsObserver;->update()V

    .line 131
    return-void
.end method

.method public onChange(Z)V
    .registers 4
    .parameter "selfChange"

    .prologue
    .line 134
    const-string v0, "TvOut-Observer"

    const-string v1, "onChange"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    invoke-virtual {p0}, Lcom/android/server/TvOutService$SettingsObserver;->update()V

    .line 136
    return-void
.end method

.method public update()V
    .registers 10

    .prologue
    .line 139
    const-string v6, "TvOut-Observer"

    const-string v7, "update"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    iget-object v6, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #getter for: Lcom/android/server/TvOutService;->mContext:Landroid/content/Context;
    invoke-static {v6}, Lcom/android/server/TvOutService;->access$000(Lcom/android/server/TvOutService;)Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 141
    .local v2, resolver:Landroid/content/ContentResolver;
    const/4 v1, 0x0

    .line 142
    .local v1, isupdatetvsystem:Z
    const/4 v0, 0x0

    .line 146
    .local v0, isupdatetvstatus:Z
    iget-object v6, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    iget-object v6, v6, Lcom/android/server/TvOutService;->mLock:Ljava/lang/Object;

    monitor-enter v6

    .line 148
    :try_start_18
    iget-object v7, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #getter for: Lcom/android/server/TvOutService;->mContext:Landroid/content/Context;
    invoke-static {v7}, Lcom/android/server/TvOutService;->access$000(Lcom/android/server/TvOutService;)Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    const-string v8, "tv_system"

    invoke-static {v7, v8}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 149
    .local v3, tvoutsystem:Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 150
    .local v5, tvsystem:I
    iget-object v7, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #getter for: Lcom/android/server/TvOutService;->mTvSystem:I
    invoke-static {v7}, Lcom/android/server/TvOutService;->access$100(Lcom/android/server/TvOutService;)I

    move-result v7

    if-eq v7, v5, :cond_3a

    .line 151
    iget-object v7, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #setter for: Lcom/android/server/TvOutService;->mTvSystem:I
    invoke-static {v7, v5}, Lcom/android/server/TvOutService;->access$102(Lcom/android/server/TvOutService;I)I

    .line 152
    const/4 v1, 0x1

    .line 156
    :cond_3a
    const-string v7, "tv_out"

    const/4 v8, 0x0

    invoke-static {v2, v7, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 157
    .local v4, tvstatus:I
    iget-object v7, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #getter for: Lcom/android/server/TvOutService;->mTvStatus:I
    invoke-static {v7}, Lcom/android/server/TvOutService;->access$200(Lcom/android/server/TvOutService;)I

    move-result v7

    if-eq v7, v4, :cond_4f

    .line 158
    iget-object v7, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #setter for: Lcom/android/server/TvOutService;->mTvStatus:I
    invoke-static {v7, v4}, Lcom/android/server/TvOutService;->access$202(Lcom/android/server/TvOutService;I)I

    .line 159
    const/4 v0, 0x1

    .line 162
    :cond_4f
    monitor-exit v6
    :try_end_50
    .catchall {:try_start_18 .. :try_end_50} :catchall_61

    .line 164
    if-eqz v1, :cond_58

    .line 165
    iget-object v6, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #calls: Lcom/android/server/TvOutService;->updatetvsystem()V
    invoke-static {v6}, Lcom/android/server/TvOutService;->access$300(Lcom/android/server/TvOutService;)V

    .line 166
    const/4 v1, 0x0

    .line 168
    :cond_58
    if-eqz v0, :cond_60

    .line 169
    iget-object v6, p0, Lcom/android/server/TvOutService$SettingsObserver;->this$0:Lcom/android/server/TvOutService;

    #calls: Lcom/android/server/TvOutService;->updatetvstatus()V
    invoke-static {v6}, Lcom/android/server/TvOutService;->access$400(Lcom/android/server/TvOutService;)V

    .line 170
    const/4 v0, 0x0

    .line 173
    :cond_60
    return-void

    .line 162
    .end local v3           #tvoutsystem:Ljava/lang/String;
    .end local v4           #tvstatus:I
    .end local v5           #tvsystem:I
    :catchall_61
    move-exception v7

    :try_start_62
    monitor-exit v6
    :try_end_63
    .catchall {:try_start_62 .. :try_end_63} :catchall_61

    throw v7
.end method
