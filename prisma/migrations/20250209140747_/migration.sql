-- DropIndex
DROP INDEX "Post_published_idx";

-- CreateIndex
CREATE INDEX "Post_published_idx" ON "Post"("published");
