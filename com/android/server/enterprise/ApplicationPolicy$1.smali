.class Lcom/android/server/enterprise/ApplicationPolicy$1;
.super Landroid/content/BroadcastReceiver;
.source "ApplicationPolicy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/server/enterprise/ApplicationPolicy;->registerPackageChangeReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/enterprise/ApplicationPolicy;


# direct methods
.method constructor <init>(Lcom/android/server/enterprise/ApplicationPolicy;)V
    .registers 2
    .parameter

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/server/enterprise/ApplicationPolicy$1;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 12
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const-string v4, "ApplicationPolicy"

    .line 118
    :try_start_4
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy$1;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    #calls: Lcom/android/server/enterprise/ApplicationPolicy;->getPackageName(Landroid/content/Intent;)Ljava/lang/String;
    invoke-static {v4, p2}, Lcom/android/server/enterprise/ApplicationPolicy;->access$000(Lcom/android/server/enterprise/ApplicationPolicy;Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v3

    .line 119
    .local v3, pkgName:Ljava/lang/String;
    const-string v4, "ApplicationPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "registerPackageChangeReceiver() onReceive: Broadcast Received for PKG:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    if-eqz v3, :cond_76

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_76

    .line 121
    const-string v4, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_33} :catch_7c

    move-result-object v5

    if-ne v4, v5, :cond_3b

    .line 123
    const-wide/16 v4, 0xbb8

    :try_start_38
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_3b} :catch_77

    .line 128
    :cond_3b
    :goto_3b
    :try_start_3b
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy$1;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    invoke-virtual {v4, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationsList(Ljava/lang/String;)[Landroid/app/enterprise/ManagedAppInfo;

    move-result-object v0

    .line 129
    .local v0, appInfo:[Landroid/app/enterprise/ManagedAppInfo;
    if-eqz v0, :cond_76

    array-length v4, v0

    if-ne v8, v4, :cond_76

    .line 130
    const/4 v4, 0x0

    aget-object v4, v0, v4

    iget v4, v4, Landroid/app/enterprise/ManagedAppInfo;->mAppDisabled:I

    if-ne v4, v8, :cond_82

    move v1, v8

    .line 131
    .local v1, disabledInMDM:Z
    :goto_4e
    if-eqz v1, :cond_76

    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy$1;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    invoke-virtual {v4, v3}, Lcom/android/server/enterprise/ApplicationPolicy;->getApplicationStateEnabled(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_76

    .line 132
    iget-object v4, p0, Lcom/android/server/enterprise/ApplicationPolicy$1;->this$0:Lcom/android/server/enterprise/ApplicationPolicy;

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Lcom/android/server/enterprise/ApplicationPolicy;->setApplicationState(Ljava/lang/String;Z)Z

    .line 133
    const-string v4, "ApplicationPolicy"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "registerPackageChangeReceiver() setApplicationState(disable) for PKG:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .end local v0           #appInfo:[Landroid/app/enterprise/ManagedAppInfo;
    .end local v1           #disabledInMDM:Z
    .end local v3           #pkgName:Ljava/lang/String;
    :cond_76
    :goto_76
    return-void

    .line 124
    .restart local v3       #pkgName:Ljava/lang/String;
    :catch_77
    move-exception v2

    .line 125
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_7b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_7b} :catch_7c

    goto :goto_3b

    .line 137
    .end local v2           #e:Ljava/lang/Exception;
    .end local v3           #pkgName:Ljava/lang/String;
    :catch_7c
    move-exception v4

    move-object v2, v4

    .line 138
    .restart local v2       #e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_76

    .end local v2           #e:Ljava/lang/Exception;
    .restart local v0       #appInfo:[Landroid/app/enterprise/ManagedAppInfo;
    .restart local v3       #pkgName:Ljava/lang/String;
    :cond_82
    move v1, v7

    .line 130
    goto :goto_4e
.end method
