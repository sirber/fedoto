-- CreateIndex
CREATE INDEX "Post_published_idx" ON "Post" USING BRIN ("published");
