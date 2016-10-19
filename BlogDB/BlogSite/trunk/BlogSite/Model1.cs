namespace BlogSite
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=BlogDBModel2")
        {
        }

        public virtual DbSet<Access> Access { get; set; }
        public virtual DbSet<Category> Category { get; set; }
        public virtual DbSet<Image> Image { get; set; }
        public virtual DbSet<Post> Post { get; set; }
        public virtual DbSet<PostAction> PostAction { get; set; }
        public virtual DbSet<PostLogEntry> PostLogEntry { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<State> State { get; set; }
        public virtual DbSet<Tag> Tag { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Access>()
                .Property(e => e.AccessName)
                .IsFixedLength();

            modelBuilder.Entity<Access>()
                .HasMany(e => e.Role)
                .WithMany(e => e.Access)
                .Map(m => m.ToTable("RoleAccess").MapLeftKey("AccessId").MapRightKey("RoleId"));

            modelBuilder.Entity<Category>()
                .Property(e => e.CategoryName)
                .IsFixedLength();

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Category1)
                .WithOptional(e => e.Category2)
                .HasForeignKey(e => e.ParentId);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Post)
                .WithMany(e => e.Category)
                .Map(m => m.ToTable("CategoryAssignment").MapLeftKey("CategoryId").MapRightKey("PostId"));

            modelBuilder.Entity<Post>()
                .Property(e => e.Headline)
                .IsFixedLength();

            modelBuilder.Entity<Post>()
                .HasMany(e => e.Tag)
                .WithMany(e => e.Post)
                .Map(m => m.ToTable("TagAssignment").MapLeftKey("PostId").MapRightKey("TagId"));

            modelBuilder.Entity<PostAction>()
                .Property(e => e.ActionName)
                .IsFixedLength();

            modelBuilder.Entity<Role>()
                .Property(e => e.RoleName)
                .IsFixedLength();

            modelBuilder.Entity<Role>()
                .HasMany(e => e.User)
                .WithMany(e => e.Role)
                .Map(m => m.ToTable("RoleAssignment").MapLeftKey("RoleId").MapRightKey("UserId"));

            modelBuilder.Entity<State>()
                .Property(e => e.StateName)
                .IsFixedLength();

            modelBuilder.Entity<Tag>()
                .Property(e => e.TagName)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.UserFirstName)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.UserLastName)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.UserEmail)
                .IsFixedLength();
        }
    }
}
