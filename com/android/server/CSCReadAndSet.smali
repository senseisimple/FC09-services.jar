.class Lcom/android/server/CSCReadAndSet;
.super Ljava/lang/Object;
.source "CSCReadAndSet.java"


# static fields
.field private static final CUSTOMER_PATH:Ljava/lang/String; = "/system/csc/"

.field private static final CUSTOMER_XML:Ljava/lang/String; = "others.xml"

.field private static final DEBUG:Z = false

.field private static final DEBUG_TAG:Ljava/lang/String; = "InputMethodManagerService_CSC"

.field private static final TAG_ROOT:Ljava/lang/String; = "DefaultInputMethod"

.field private static final TAG_input_method:Ljava/lang/String; = "input_method"

.field private static mCustomerNode:Lorg/w3c/dom/Node;

.field private static mDoc:Lorg/w3c/dom/Document;

.field private static mRoot:Lorg/w3c/dom/Node;

.field private static sInstance:Lcom/android/server/CSCReadAndSet;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 33
    new-instance v0, Lcom/android/server/CSCReadAndSet;

    invoke-direct {v0}, Lcom/android/server/CSCReadAndSet;-><init>()V

    sput-object v0, Lcom/android/server/CSCReadAndSet;->sInstance:Lcom/android/server/CSCReadAndSet;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    return-void
.end method

.method public static getInstance(Ljava/lang/String;)Lcom/android/server/CSCReadAndSet;
    .registers 3
    .parameter "fileName"

    .prologue
    .line 47
    if-nez p0, :cond_c

    .line 48
    sget-object v0, Lcom/android/server/CSCReadAndSet;->sInstance:Lcom/android/server/CSCReadAndSet;

    const-string v1, "others.xml"

    invoke-direct {v0, v1}, Lcom/android/server/CSCReadAndSet;->loadXMLFile(Ljava/lang/String;)V

    .line 51
    :goto_9
    sget-object v0, Lcom/android/server/CSCReadAndSet;->sInstance:Lcom/android/server/CSCReadAndSet;

    return-object v0

    .line 50
    :cond_c
    sget-object v0, Lcom/android/server/CSCReadAndSet;->sInstance:Lcom/android/server/CSCReadAndSet;

    invoke-direct {v0, p0}, Lcom/android/server/CSCReadAndSet;->loadXMLFile(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private getTagNode(Lorg/w3c/dom/Node;Ljava/lang/String;)Lorg/w3c/dom/Node;
    .registers 9
    .parameter "parent"
    .parameter "tagName"

    .prologue
    const/4 v5, 0x0

    .line 89
    if-eqz p1, :cond_5

    if-nez p2, :cond_7

    :cond_5
    move-object v4, v5

    .line 107
    :goto_6
    return-object v4

    .line 95
    :cond_7
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 96
    .local v1, children:Lorg/w3c/dom/NodeList;
    if-eqz v1, :cond_29

    .line 97
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 98
    .local v3, n:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_12
    if-ge v2, v3, :cond_29

    .line 99
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 100
    .local v0, child:Lorg/w3c/dom/Node;
    if-eqz v0, :cond_26

    .line 102
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_26

    move-object v4, v0

    .line 103
    goto :goto_6

    .line 98
    :cond_26
    add-int/lit8 v2, v2, 0x1

    goto :goto_12

    .end local v0           #child:Lorg/w3c/dom/Node;
    .end local v2           #i:I
    .end local v3           #n:I
    :cond_29
    move-object v4, v5

    .line 107
    goto :goto_6
.end method

.method private getTagValue(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .parameter "tagFullName"

    .prologue
    const/4 v2, 0x0

    .line 111
    if-eqz p1, :cond_7

    sget-object v1, Lcom/android/server/CSCReadAndSet;->mCustomerNode:Lorg/w3c/dom/Node;

    if-nez v1, :cond_9

    :cond_7
    move-object v1, v2

    .line 123
    :goto_8
    return-object v1

    .line 117
    :cond_9
    sget-object v1, Lcom/android/server/CSCReadAndSet;->mCustomerNode:Lorg/w3c/dom/Node;

    invoke-direct {p0, v1, p1}, Lcom/android/server/CSCReadAndSet;->getTagNode(Lorg/w3c/dom/Node;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 119
    .local v0, node:Lorg/w3c/dom/Node;
    if-eqz v0, :cond_1a

    .line 120
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_8

    :cond_1a
    move-object v1, v2

    .line 123
    goto :goto_8
.end method

.method private getTagValueReturnString(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "tagFullName"

    .prologue
    .line 127
    if-nez p1, :cond_4

    .line 128
    const/4 v1, 0x0

    .line 134
    :goto_3
    return-object v1

    .line 132
    :cond_4
    invoke-direct {p0, p1}, Lcom/android/server/CSCReadAndSet;->getTagValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, tagValue:Ljava/lang/String;
    move-object v1, v0

    .line 134
    goto :goto_3
.end method

.method private loadXMLFile(Ljava/lang/String;)V
    .registers 7
    .parameter "fileName"

    .prologue
    .line 56
    :try_start_0
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 57
    .local v1, factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 58
    .local v0, builder:Ljavax/xml/parsers/DocumentBuilder;
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/system/csc/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v2

    sput-object v2, Lcom/android/server/CSCReadAndSet;->mDoc:Lorg/w3c/dom/Document;

    .line 59
    sget-object v2, Lcom/android/server/CSCReadAndSet;->mDoc:Lorg/w3c/dom/Document;

    if-nez v2, :cond_2b

    .line 85
    .end local v0           #builder:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :cond_2a
    :goto_2a
    return-void

    .line 65
    .restart local v0       #builder:Ljavax/xml/parsers/DocumentBuilder;
    .restart local v1       #factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :cond_2b
    sget-object v2, Lcom/android/server/CSCReadAndSet;->mDoc:Lorg/w3c/dom/Document;

    invoke-interface {v2}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v2

    sput-object v2, Lcom/android/server/CSCReadAndSet;->mRoot:Lorg/w3c/dom/Node;

    .line 66
    sget-object v2, Lcom/android/server/CSCReadAndSet;->mRoot:Lorg/w3c/dom/Node;

    if-eqz v2, :cond_2a

    .line 72
    sget-object v2, Lcom/android/server/CSCReadAndSet;->mRoot:Lorg/w3c/dom/Node;

    const-string v3, "DefaultInputMethod"

    invoke-direct {p0, v2, v3}, Lcom/android/server/CSCReadAndSet;->getTagNode(Lorg/w3c/dom/Node;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v2

    sput-object v2, Lcom/android/server/CSCReadAndSet;->mCustomerNode:Lorg/w3c/dom/Node;

    .line 73
    sget-object v2, Lcom/android/server/CSCReadAndSet;->mCustomerNode:Lorg/w3c/dom/Node;
    :try_end_43
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_43} :catch_4a
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_43} :catch_48
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_43} :catch_46

    if-nez v2, :cond_2a

    goto :goto_2a

    .line 82
    .end local v0           #builder:Ljavax/xml/parsers/DocumentBuilder;
    .end local v1           #factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    :catch_46
    move-exception v2

    goto :goto_2a

    .line 80
    :catch_48
    move-exception v2

    goto :goto_2a

    .line 78
    :catch_4a
    move-exception v2

    goto :goto_2a
.end method


# virtual methods
.method public setCustomerCSC(Landroid/content/Context;Ljava/util/List;)Z
    .registers 11
    .parameter "context"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Landroid/view/inputmethod/InputMethodInfo;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p2, enabled:Ljava/util/List;,"Ljava/util/List<Landroid/view/inputmethod/InputMethodInfo;>;"
    const/4 v6, 0x0

    .line 140
    if-eqz p1, :cond_f

    sget-object v5, Lcom/android/server/CSCReadAndSet;->mCustomerNode:Lorg/w3c/dom/Node;

    if-eqz v5, :cond_f

    if-eqz p2, :cond_f

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_11

    :cond_f
    move v5, v6

    .line 173
    :goto_10
    return v5

    .line 144
    :cond_11
    iput-object p1, p0, Lcom/android/server/CSCReadAndSet;->mContext:Landroid/content/Context;

    .line 147
    const-string v5, "input_method"

    invoke-direct {p0, v5}, Lcom/android/server/CSCReadAndSet;->getTagValueReturnString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 150
    .local v4, inputMethod:Ljava/lang/String;
    if-nez v4, :cond_1d

    move v5, v6

    .line 151
    goto :goto_10

    .line 155
    :cond_1d
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    .line 156
    .local v0, N:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_22
    if-ge v2, v0, :cond_4b

    .line 157
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/inputmethod/InputMethodInfo;

    .line 159
    .local v3, imi:Landroid/view/inputmethod/InputMethodInfo;
    invoke-virtual {v3}, Landroid/view/inputmethod/InputMethodInfo;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_48

    .line 160
    iget-object v5, p0, Lcom/android/server/CSCReadAndSet;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "default_input_method"

    invoke-virtual {v3}, Landroid/view/inputmethod/InputMethodInfo;->getId()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Landroid/provider/Settings$Secure;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 164
    .local v1, flag:Z
    if-nez v1, :cond_46

    :cond_46
    move v5, v1

    .line 169
    goto :goto_10

    .line 156
    .end local v1           #flag:Z
    :cond_48
    add-int/lit8 v2, v2, 0x1

    goto :goto_22

    .end local v3           #imi:Landroid/view/inputmethod/InputMethodInfo;
    :cond_4b
    move v5, v6

    .line 173
    goto :goto_10
.end method
