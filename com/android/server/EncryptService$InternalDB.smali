.class public Lcom/android/server/EncryptService$InternalDB;
.super Ljava/lang/Object;
.source "EncryptService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/EncryptService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "InternalDB"
.end annotation


# instance fields
.field private mCryptoPolicy:I

.field private m_PwdHashCode:Ljava/lang/String;

.field private m_State:Ljava/lang/String;

.field private m_StorageCID:Ljava/lang/String;

.field private m_WorkingPath:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/server/EncryptService;


# direct methods
.method constructor <init>(Lcom/android/server/EncryptService;)V
    .registers 4
    .parameter

    .prologue
    const-string v1, ""

    .line 934
    iput-object p1, p0, Lcom/android/server/EncryptService$InternalDB;->this$0:Lcom/android/server/EncryptService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 927
    const-string v0, "none"

    iput-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_State:Ljava/lang/String;

    .line 928
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_PwdHashCode:Ljava/lang/String;

    .line 929
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_WorkingPath:Ljava/lang/String;

    .line 930
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_StorageCID:Ljava/lang/String;

    .line 931
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/EncryptService$InternalDB;->mCryptoPolicy:I

    .line 935
    invoke-virtual {p0}, Lcom/android/server/EncryptService$InternalDB;->init()V

    .line 936
    return-void
.end method


# virtual methods
.method protected getCryptoPolicy()I
    .registers 2

    .prologue
    .line 989
    iget v0, p0, Lcom/android/server/EncryptService$InternalDB;->mCryptoPolicy:I

    return v0
.end method

.method protected getPwdHashCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 971
    iget-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_PwdHashCode:Ljava/lang/String;

    return-object v0
.end method

.method protected getState()Ljava/lang/String;
    .registers 2

    .prologue
    .line 962
    iget-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_State:Ljava/lang/String;

    return-object v0
.end method

.method protected getStorageCID()Ljava/lang/String;
    .registers 2

    .prologue
    .line 953
    iget-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_StorageCID:Ljava/lang/String;

    return-object v0
.end method

.method protected getWorkingPath()Ljava/lang/String;
    .registers 2

    .prologue
    .line 981
    iget-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_WorkingPath:Ljava/lang/String;

    return-object v0
.end method

.method init()V
    .registers 3

    .prologue
    const-string v1, ""

    .line 939
    const-string v0, "none"

    iput-object v0, p0, Lcom/android/server/EncryptService$InternalDB;->m_State:Ljava/lang/String;

    .line 940
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_PwdHashCode:Ljava/lang/String;

    .line 941
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_WorkingPath:Ljava/lang/String;

    .line 942
    const-string v0, ""

    iput-object v1, p0, Lcom/android/server/EncryptService$InternalDB;->m_StorageCID:Ljava/lang/String;

    .line 943
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/server/EncryptService$InternalDB;->mCryptoPolicy:I

    .line 944
    return-void
.end method

.method protected setCryptoPolicy(I)V
    .registers 2
    .parameter "policy"

    .prologue
    .line 985
    iput p1, p0, Lcom/android/server/EncryptService$InternalDB;->mCryptoPolicy:I

    .line 986
    return-void
.end method

.method protected setPwdHashCode(Ljava/lang/String;)V
    .registers 2
    .parameter "sPwdHashCode"

    .prologue
    .line 967
    iput-object p1, p0, Lcom/android/server/EncryptService$InternalDB;->m_PwdHashCode:Ljava/lang/String;

    .line 968
    return-void
.end method

.method protected setState(Ljava/lang/String;)V
    .registers 2
    .parameter "state"

    .prologue
    .line 958
    iput-object p1, p0, Lcom/android/server/EncryptService$InternalDB;->m_State:Ljava/lang/String;

    .line 959
    return-void
.end method

.method protected setStorageCID(Ljava/lang/String;)V
    .registers 3
    .parameter "cid"

    .prologue
    .line 948
    if-eqz p1, :cond_a

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_a

    .line 949
    iput-object p1, p0, Lcom/android/server/EncryptService$InternalDB;->m_StorageCID:Ljava/lang/String;

    .line 950
    :cond_a
    return-void
.end method

.method protected setWorkingPath(Ljava/lang/String;)V
    .registers 2
    .parameter "sPath"

    .prologue
    .line 977
    iput-object p1, p0, Lcom/android/server/EncryptService$InternalDB;->m_WorkingPath:Ljava/lang/String;

    .line 978
    return-void
.end method
