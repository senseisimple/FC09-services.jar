.class public Lcom/android/server/enterprise/NetworkPolicy;
.super Landroid/app/enterprise/INetworkPolicy$Stub;
.source "NetworkPolicy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/enterprise/NetworkPolicy$Carriers;
    }
.end annotation


# static fields
.field public static AUTH_TYPE_CHAP:I

.field public static AUTH_TYPE_NONE:I

.field private static AUTH_TYPE_NOTSET:I

.field public static AUTH_TYPE_PAP:I

.field public static AUTH_TYPE_PAP_OR_CHAP:I


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 23
    const/4 v0, -0x1

    sput v0, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_NOTSET:I

    .line 25
    const/4 v0, 0x0

    sput v0, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_NONE:I

    .line 27
    const/4 v0, 0x1

    sput v0, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_PAP:I

    .line 29
    const/4 v0, 0x2

    sput v0, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_CHAP:I

    .line 31
    const/4 v0, 0x3

    sput v0, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_PAP_OR_CHAP:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "ctx"

    .prologue
    .line 33
    invoke-direct {p0}, Landroid/app/enterprise/INetworkPolicy$Stub;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    .line 35
    return-void
.end method

.method private declared-synchronized addUpdateAp(ZJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)J
    .registers 37
    .parameter "isNewAp"
    .parameter "apId"
    .parameter "name"
    .parameter "apn"
    .parameter "mcc"
    .parameter "mnc"
    .parameter "user"
    .parameter "server"
    .parameter "password"
    .parameter "proxy"
    .parameter "port"
    .parameter "mmsProxy"
    .parameter "mmsPort"
    .parameter "mmsc"
    .parameter "apType"
    .parameter "authType"

    .prologue
    .line 108
    monitor-enter p0

    const/4 v12, 0x1

    .line 109
    .local v12, success:Z
    const-wide/16 v10, -0x1

    .line 110
    .local v10, rowId:J
    const/4 v5, 0x0

    .local v5, devMCC:Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, devMNC:Ljava/lang/String;
    const/4 v7, 0x0

    .line 112
    .local v7, devSimOperatorNumeric:Ljava/lang/String;
    :try_start_7
    move-object/from16 v0, p0

    move-object/from16 v1, p4

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    .line 113
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p5

    .line 114
    move-object/from16 v0, p0

    move-object/from16 v1, p6

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    .line 115
    move-object/from16 v0, p0

    move-object/from16 v1, p7

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_26
    .catchall {:try_start_7 .. :try_end_26} :catchall_2d9

    move-result-object p7

    .line 120
    :try_start_27
    invoke-static/range {p7 .. p7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 121
    invoke-static/range {p6 .. p6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 123
    if-nez p1, :cond_35

    const-wide/16 v16, 0x1

    cmp-long v16, v16, p2

    if-gtz v16, :cond_75

    :cond_35
    if-eqz p6, :cond_75

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->length()I

    move-result v16

    if-eqz v16, :cond_75

    if-eqz p7, :cond_75

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result v16

    if-eqz v16, :cond_75

    if-eqz p4, :cond_75

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v16

    if-eqz v16, :cond_75

    if-eqz p5, :cond_75

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v16

    if-eqz v16, :cond_75

    const/16 v16, -0x1

    move/from16 v0, v16

    move/from16 v1, p12

    if-gt v0, v1, :cond_75

    const/16 v16, -0x1

    move/from16 v0, v16

    move/from16 v1, p14

    if-gt v0, v1, :cond_75

    const/16 v16, -0x2

    move/from16 v0, v16

    move/from16 v1, p17

    if-gt v0, v1, :cond_75

    const/16 v16, 0x3

    move/from16 v0, v16

    move/from16 v1, p17

    if-ge v0, v1, :cond_fb

    .line 125
    :cond_75
    const/4 v12, 0x0

    .line 126
    if-nez p1, :cond_98

    const-wide/16 v16, 0x1

    cmp-long v16, v16, p2

    if-lez v16, :cond_98

    .line 127
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "addUpdateAp() : invalid ap Id "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    move-wide/from16 v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 128
    :cond_98
    if-eqz p4, :cond_a0

    invoke-virtual/range {p4 .. p4}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_a5

    .line 129
    :cond_a0
    const-string v16, "addUpdateAp() : invalid ap name"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 130
    :cond_a5
    if-eqz p5, :cond_ad

    invoke-virtual/range {p5 .. p5}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_b2

    .line 131
    :cond_ad
    const-string v16, "addUpdateAp() : invalid ap apn"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 132
    :cond_b2
    if-eqz p6, :cond_ba

    invoke-virtual/range {p6 .. p6}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_bf

    .line 133
    :cond_ba
    const-string v16, "addUpdateAp() : invalid ap mcc"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 134
    :cond_bf
    if-eqz p7, :cond_c7

    invoke-virtual/range {p7 .. p7}, Ljava/lang/String;->length()I

    move-result v16

    if-nez v16, :cond_cc

    .line 135
    :cond_c7
    const-string v16, "addUpdateAp() : invalid ap mnc"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 136
    :cond_cc
    const/16 v16, -0x1

    move/from16 v0, v16

    move/from16 v1, p12

    if-le v0, v1, :cond_d9

    .line 137
    const-string v16, "addUpdateAp() : invalid ap port"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 138
    :cond_d9
    const/16 v16, -0x1

    move/from16 v0, v16

    move/from16 v1, p14

    if-le v0, v1, :cond_e6

    .line 139
    const-string v16, "addUpdateAp() : invalid ap mmsPort"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 140
    :cond_e6
    const/16 v16, -0x2

    move/from16 v0, v16

    move/from16 v1, p17

    if-gt v0, v1, :cond_f6

    const/16 v16, 0x3

    move/from16 v0, v16

    move/from16 v1, p17

    if-ge v0, v1, :cond_fb

    .line 141
    :cond_f6
    const-string v16, "addUpdateAp() : invalid ap authType"

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_fb
    .catchall {:try_start_27 .. :try_end_fb} :catchall_2d9
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_fb} :catch_2d0

    .line 148
    :cond_fb
    :goto_fb
    if-eqz v12, :cond_2ce

    .line 150
    :try_start_fd
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    const-string v17, "phone"

    invoke-virtual/range {v16 .. v17}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/telephony/TelephonyManager;

    .line 151
    .local v13, tm:Landroid/telephony/TelephonyManager;
    invoke-virtual {v13}, Landroid/telephony/TelephonyManager;->getSimOperator()Ljava/lang/String;

    move-result-object v7

    .line 153
    if-eqz v7, :cond_133

    const/16 v16, 0x4

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    if-ge v0, v1, :cond_133

    .line 155
    const/16 v16, 0x0

    const/16 v17, 0x3

    move-object v0, v7

    move/from16 v1, v16

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 157
    const/16 v16, 0x3

    move-object v0, v7

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    .line 161
    :cond_133
    move-object/from16 v0, p0

    move-object v1, v7

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 162
    move-object/from16 v0, p0

    move-object/from16 v1, p8

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p8

    .line 163
    move-object/from16 v0, p0

    move-object/from16 v1, p9

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p9

    .line 164
    move-object/from16 v0, p0

    move-object/from16 v1, p10

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p10

    .line 165
    move-object/from16 v0, p0

    move-object/from16 v1, p11

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p11

    .line 166
    move-object/from16 v0, p0

    move-object/from16 v1, p13

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p13

    .line 167
    move-object/from16 v0, p0

    move-object/from16 v1, p15

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p15

    .line 168
    move-object/from16 v0, p0

    move-object/from16 v1, p16

    invoke-direct {v0, v1}, Lcom/android/server/enterprise/NetworkPolicy;->validateString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p16

    .line 170
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 172
    .local v15, values:Landroid/content/ContentValues;
    const-string v16, "name"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p4

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 174
    const-string v16, "numeric"

    if-eqz p6, :cond_18b

    if-nez p7, :cond_2dc

    :cond_18b
    const/16 v17, 0x0

    :goto_18d
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, v17

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    const-string v16, "mcc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p6

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 176
    const-string v16, "mnc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p7

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    const-string v16, "apn"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    const-string v16, "user"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p8

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const-string v16, "server"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p9

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    const-string v16, "password"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p10

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    const-string v16, "proxy"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p11

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-string v16, "port"

    if-ltz p12, :cond_2f7

    invoke-static/range {p12 .. p12}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    :goto_203
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, v17

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    const-string v16, "mmsproxy"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p13

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 184
    const-string v16, "mmsport"

    if-ltz p14, :cond_2fb

    invoke-static/range {p14 .. p14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v17

    :goto_225
    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, v17

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    const-string v16, "mmsc"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p15

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    if-eqz p1, :cond_303

    .line 188
    const-string v16, "authtype"

    const/16 v17, -0x2

    move/from16 v0, v17

    move/from16 v1, p17

    if-ge v0, v1, :cond_2ff

    const/16 v17, 0x4

    move/from16 v0, v17

    move/from16 v1, p17

    if-le v0, v1, :cond_2ff

    move/from16 v17, p17

    :goto_255
    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 192
    :cond_25c
    :goto_25c
    const-string v16, "type"

    move-object/from16 v0, p0

    move/from16 v1, p1

    move-object v2, v15

    move-object/from16 v3, v16

    move-object/from16 v4, p16

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/server/enterprise/NetworkPolicy;->setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    if-eqz v6, :cond_28b

    if-eqz v5, :cond_28b

    .line 195
    move-object v0, v6

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_28b

    move-object v0, v5

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v16

    if-eqz v16, :cond_28b

    .line 196
    const-string v16, "current"

    const/16 v17, 0x1

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 200
    :cond_28b
    invoke-virtual {v15}, Landroid/content/ContentValues;->size()I

    move-result v16

    if-lez v16, :cond_37d

    .line 201
    if-eqz p1, :cond_32c

    .line 203
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v16

    sget-object v17, Lcom/android/server/enterprise/NetworkPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    move-object v2, v15

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v14

    .line 204
    .local v14, url:Landroid/net/Uri;
    if-eqz v14, :cond_327

    const/16 v16, 0x1

    move/from16 v12, v16

    .line 205
    :goto_2ae
    if-eqz v12, :cond_2ce

    .line 206
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "addUpdateAp Created rowUri : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 207
    invoke-static {v14}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J
    :try_end_2cd
    .catchall {:try_start_fd .. :try_end_2cd} :catchall_2d9
    .catch Ljava/lang/Exception; {:try_start_fd .. :try_end_2cd} :catch_320

    move-result-wide v10

    .line 226
    .end local v13           #tm:Landroid/telephony/TelephonyManager;
    .end local v14           #url:Landroid/net/Uri;
    .end local v15           #values:Landroid/content/ContentValues;
    :cond_2ce
    :goto_2ce
    monitor-exit p0

    return-wide v10

    .line 143
    :catch_2d0
    move-exception v16

    move-object/from16 v8, v16

    .line 144
    .local v8, e:Ljava/lang/Exception;
    const/4 v12, 0x0

    .line 145
    :try_start_2d4
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2d7
    .catchall {:try_start_2d4 .. :try_end_2d7} :catchall_2d9

    goto/16 :goto_fb

    .line 108
    .end local v8           #e:Ljava/lang/Exception;
    :catchall_2d9
    move-exception v16

    monitor-exit p0

    throw v16

    .line 174
    .restart local v13       #tm:Landroid/telephony/TelephonyManager;
    .restart local v15       #values:Landroid/content/ContentValues;
    :cond_2dc
    :try_start_2dc
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v17

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p7

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_18d

    .line 182
    :cond_2f7
    const/16 v17, 0x0

    goto/16 :goto_203

    .line 184
    :cond_2fb
    const/16 v17, 0x0

    goto/16 :goto_225

    .line 188
    :cond_2ff
    sget v17, Lcom/android/server/enterprise/NetworkPolicy;->AUTH_TYPE_NOTSET:I

    goto/16 :goto_255

    .line 189
    :cond_303
    if-nez p1, :cond_25c

    const/16 v16, -0x2

    move/from16 v0, v16

    move/from16 v1, p17

    if-ge v0, v1, :cond_25c

    const/16 v16, 0x4

    move/from16 v0, v16

    move/from16 v1, p17

    if-le v0, v1, :cond_25c

    .line 190
    const-string v16, "authtype"

    invoke-static/range {p17 .. p17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    invoke-virtual/range {v15 .. v17}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_31e
    .catchall {:try_start_2dc .. :try_end_31e} :catchall_2d9
    .catch Ljava/lang/Exception; {:try_start_2dc .. :try_end_31e} :catch_320

    goto/16 :goto_25c

    .line 222
    .end local v13           #tm:Landroid/telephony/TelephonyManager;
    .end local v15           #values:Landroid/content/ContentValues;
    :catch_320
    move-exception v16

    move-object/from16 v8, v16

    .line 223
    .restart local v8       #e:Ljava/lang/Exception;
    :try_start_323
    invoke-virtual {v8}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_326
    .catchall {:try_start_323 .. :try_end_326} :catchall_2d9

    goto :goto_2ce

    .line 204
    .end local v8           #e:Ljava/lang/Exception;
    .restart local v13       #tm:Landroid/telephony/TelephonyManager;
    .restart local v14       #url:Landroid/net/Uri;
    .restart local v15       #values:Landroid/content/ContentValues;
    :cond_327
    const/16 v16, 0x0

    move/from16 v12, v16

    goto :goto_2ae

    .line 211
    .end local v14           #url:Landroid/net/Uri;
    :cond_32c
    :try_start_32c
    sget-object v16, Lcom/android/server/enterprise/NetworkPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object/from16 v0, v16

    move-wide/from16 v1, p2

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v14

    .line 212
    .restart local v14       #url:Landroid/net/Uri;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    move-object/from16 v16, v0

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v16

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, v16

    move-object v1, v14

    move-object v2, v15

    move-object/from16 v3, v17

    move-object/from16 v4, v18

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v9

    .line 213
    .local v9, rowCount:I
    if-lez v9, :cond_378

    const/16 v16, 0x1

    move/from16 v12, v16

    .line 214
    :goto_356
    if-eqz v12, :cond_2ce

    .line 215
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "addUpdateAp Updated rowUri : "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 216
    invoke-static {v14}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v10

    goto/16 :goto_2ce

    .line 213
    :cond_378
    const/16 v16, 0x0

    move/from16 v12, v16

    goto :goto_356

    .line 220
    .end local v9           #rowCount:I
    .end local v14           #url:Landroid/net/Uri;
    :cond_37d
    const-string v16, "addUpdateAp Error: Empty dataset."

    invoke-static/range {v16 .. v16}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_382
    .catchall {:try_start_32c .. :try_end_382} :catchall_2d9
    .catch Ljava/lang/Exception; {:try_start_32c .. :try_end_382} :catch_320

    goto/16 :goto_2ce
.end method

.method private isValidApId(J)Z
    .registers 14
    .parameter "apId"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 230
    const/4 v8, 0x0

    .line 231
    .local v8, isValid:Z
    const/4 v6, 0x0

    .line 232
    .local v6, c:Landroid/database/Cursor;
    const-wide/16 v3, 0x0

    cmp-long v0, v3, p1

    if-gez v0, :cond_65

    .line 233
    new-array v2, v10, [Ljava/lang/String;

    const-string v0, "_id"

    aput-object v0, v2, v9

    .line 237
    .local v2, ID_PROJECTION:[Ljava/lang/String;
    :try_start_10
    sget-object v0, Lcom/android/server/enterprise/NetworkPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v0, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    .line 238
    .local v1, url:Landroid/net/Uri;
    iget-object v0, p0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isValidApId() row count : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " for apId : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    .line 240
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_4a
    .catchall {:try_start_10 .. :try_end_4a} :catchall_5e
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_4a} :catch_56

    move-result v0

    if-lez v0, :cond_54

    move v8, v10

    .line 244
    :goto_4e
    if-eqz v6, :cond_53

    .line 245
    .end local v1           #url:Landroid/net/Uri;
    :goto_50
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 249
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :cond_53
    :goto_53
    return v8

    .restart local v1       #url:Landroid/net/Uri;
    .restart local v2       #ID_PROJECTION:[Ljava/lang/String;
    :cond_54
    move v8, v9

    .line 240
    goto :goto_4e

    .line 241
    .end local v1           #url:Landroid/net/Uri;
    :catch_56
    move-exception v0

    move-object v7, v0

    .line 242
    .local v7, e:Ljava/lang/Exception;
    :try_start_58
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5b
    .catchall {:try_start_58 .. :try_end_5b} :catchall_5e

    .line 244
    if-eqz v6, :cond_53

    goto :goto_50

    .end local v7           #e:Ljava/lang/Exception;
    :catchall_5e
    move-exception v0

    if-eqz v6, :cond_64

    .line 245
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 244
    :cond_64
    throw v0

    .line 248
    .end local v2           #ID_PROJECTION:[Ljava/lang/String;
    :cond_65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isValidApId() : invalid apId : "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V

    goto :goto_53
.end method

.method private setColumnValue(ZLandroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "isNewAp"
    .parameter "values"
    .parameter "key"
    .parameter "value"

    .prologue
    .line 259
    if-eqz p1, :cond_f

    .line 260
    if-nez p4, :cond_a

    const-string v0, ""

    :goto_6
    invoke-virtual {p2, p3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 266
    :cond_9
    :goto_9
    return-void

    .line 260
    :cond_a
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    .line 263
    :cond_f
    if-eqz p4, :cond_9

    .line 264
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, p3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9
.end method

.method private validateString(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .parameter "value"

    .prologue
    .line 269
    if-nez p1, :cond_4

    move-object v0, p1

    :goto_3
    return-object v0

    :cond_4
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method


# virtual methods
.method public addNewAp(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)J
    .registers 33
    .parameter "name"
    .parameter "apn"
    .parameter "mcc"
    .parameter "mnc"
    .parameter "user"
    .parameter "server"
    .parameter "password"
    .parameter "proxy"
    .parameter "port"
    .parameter "mmsProxy"
    .parameter "mmsPort"
    .parameter "mmsc"
    .parameter "apType"
    .parameter "authType"

    .prologue
    .line 43
    const/4 v1, 0x1

    const-wide/16 v2, -0x1

    move-object/from16 v0, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    move-object/from16 v8, p5

    move-object/from16 v9, p6

    move-object/from16 v10, p7

    move-object/from16 v11, p8

    move/from16 v12, p9

    move-object/from16 v13, p10

    move/from16 v14, p11

    move-object/from16 v15, p12

    move-object/from16 v16, p13

    move/from16 v17, p14

    invoke-direct/range {v0 .. v17}, Lcom/android/server/enterprise/NetworkPolicy;->addUpdateAp(ZJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized deleteAp(J)Z
    .registers 10
    .parameter "apId"

    .prologue
    const/4 v6, 0x0

    .line 86
    monitor-enter p0

    const/4 v1, -0x1

    .line 87
    .local v1, rowCount:I
    const-wide/16 v3, 0x1

    cmp-long v3, v3, p1

    if-lez v3, :cond_11

    .line 88
    :try_start_9
    const-string v3, "deleteAp : apId is invalid"

    invoke-static {v3}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_e
    .catchall {:try_start_9 .. :try_end_e} :catchall_43

    move v3, v6

    .line 98
    :goto_f
    monitor-exit p0

    return v3

    .line 92
    :cond_11
    :try_start_11
    sget-object v3, Lcom/android/server/enterprise/NetworkPolicy$Carriers;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v3, p1, p2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 93
    .local v2, uri:Landroid/net/Uri;
    iget-object v3, p0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v3, v2, v4, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 94
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "deleteAp : deleted rowCount from ApTable : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_39
    .catchall {:try_start_11 .. :try_end_39} :catchall_43
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_39} :catch_3d

    .line 98
    .end local v2           #uri:Landroid/net/Uri;
    :goto_39
    if-lez v1, :cond_46

    const/4 v3, 0x1

    goto :goto_f

    .line 95
    :catch_3d
    move-exception v3

    move-object v0, v3

    .line 96
    .local v0, e:Ljava/lang/Exception;
    :try_start_3f
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_43

    goto :goto_39

    .line 86
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_43
    move-exception v3

    monitor-exit p0

    throw v3

    :cond_46
    move v3, v6

    .line 98
    goto :goto_f
.end method

.method public setApSettings(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)J
    .registers 35
    .parameter "apId"
    .parameter "name"
    .parameter "apn"
    .parameter "mcc"
    .parameter "mnc"
    .parameter "user"
    .parameter "server"
    .parameter "password"
    .parameter "proxy"
    .parameter "port"
    .parameter "mmsProxy"
    .parameter "mmsPort"
    .parameter "mmsc"
    .parameter "apType"
    .parameter "authType"

    .prologue
    .line 52
    const/4 v1, 0x0

    move-object/from16 v0, p0

    move-wide/from16 v2, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v13, p12

    move/from16 v14, p13

    move-object/from16 v15, p14

    move-object/from16 v16, p15

    move/from16 v17, p16

    invoke-direct/range {v0 .. v17}, Lcom/android/server/enterprise/NetworkPolicy;->addUpdateAp(ZJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;I)J

    move-result-wide v0

    return-wide v0
.end method

.method public declared-synchronized setpreferredAp(J)Z
    .registers 11
    .parameter "apId"

    .prologue
    const-wide/16 v5, 0x0

    .line 59
    monitor-enter p0

    const/4 v2, 0x0

    .line 61
    .local v2, success:Z
    cmp-long v4, v5, p1

    if-eqz v4, :cond_24

    cmp-long v4, v5, p1

    if-lez v4, :cond_24

    .line 62
    :try_start_c
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPreferedAp() : invalid ap Id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_22
    .catchall {:try_start_c .. :try_end_22} :catchall_6d
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_22} :catch_67

    .line 76
    :cond_22
    :goto_22
    monitor-exit p0

    return v2

    .line 64
    :cond_24
    :try_start_24
    invoke-direct {p0, p1, p2}, Lcom/android/server/enterprise/NetworkPolicy;->isValidApId(J)Z

    move-result v2

    .line 65
    if-eqz v2, :cond_22

    .line 66
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 67
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "apn_id"

    cmp-long v5, v5, p1

    if-nez v5, :cond_70

    const-wide/16 v5, -0x1

    :goto_37
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 68
    iget-object v4, p0, Lcom/android/server/enterprise/NetworkPolicy;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/android/server/enterprise/NetworkPolicy$Carriers;->PREFERAPN_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v3, v6, v7}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 69
    .local v1, rowCount:I
    if-lez v1, :cond_72

    const/4 v4, 0x1

    move v2, v4

    .line 70
    :goto_50
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setPreferedAp() row count : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/android/server/enterprise/Utils;->writeToLog(Ljava/lang/String;)V
    :try_end_66
    .catchall {:try_start_24 .. :try_end_66} :catchall_6d
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_66} :catch_67

    goto :goto_22

    .line 73
    .end local v1           #rowCount:I
    .end local v3           #values:Landroid/content/ContentValues;
    :catch_67
    move-exception v4

    move-object v0, v4

    .line 74
    .local v0, e:Ljava/lang/Exception;
    :try_start_69
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_6c
    .catchall {:try_start_69 .. :try_end_6c} :catchall_6d

    goto :goto_22

    .line 59
    .end local v0           #e:Ljava/lang/Exception;
    :catchall_6d
    move-exception v4

    monitor-exit p0

    throw v4

    .restart local v3       #values:Landroid/content/ContentValues;
    :cond_70
    move-wide v5, p1

    .line 67
    goto :goto_37

    .line 69
    .restart local v1       #rowCount:I
    :cond_72
    const/4 v4, 0x0

    move v2, v4

    goto :goto_50
.end method
