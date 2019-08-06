namespace MusicStore
{
    partial class FormMusicStore
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.MusicStore = new System.Windows.Forms.TabControl();
            this.tabOwner = new System.Windows.Forms.TabPage();
            this.tabCD = new System.Windows.Forms.TabPage();
            this.tabCDTrack = new System.Windows.Forms.TabPage();
            this.dgvOwner = new System.Windows.Forms.DataGridView();
            this.dgvCD = new System.Windows.Forms.DataGridView();
            this.dgvCDTracks = new System.Windows.Forms.DataGridView();
            this.MusicStore.SuspendLayout();
            this.tabOwner.SuspendLayout();
            this.tabCD.SuspendLayout();
            this.tabCDTrack.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOwner)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCD)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCDTracks)).BeginInit();
            this.SuspendLayout();
            // 
            // MusicStore
            // 
            this.MusicStore.Controls.Add(this.tabOwner);
            this.MusicStore.Controls.Add(this.tabCD);
            this.MusicStore.Controls.Add(this.tabCDTrack);
            this.MusicStore.Location = new System.Drawing.Point(12, 12);
            this.MusicStore.Name = "MusicStore";
            this.MusicStore.SelectedIndex = 0;
            this.MusicStore.Size = new System.Drawing.Size(766, 305);
            this.MusicStore.TabIndex = 0;
            // 
            // tabOwner
            // 
            this.tabOwner.Controls.Add(this.dgvOwner);
            this.tabOwner.Location = new System.Drawing.Point(4, 22);
            this.tabOwner.Name = "tabOwner";
            this.tabOwner.Padding = new System.Windows.Forms.Padding(3);
            this.tabOwner.Size = new System.Drawing.Size(758, 279);
            this.tabOwner.TabIndex = 0;
            this.tabOwner.Text = "Owner";
            this.tabOwner.UseVisualStyleBackColor = true;
            // 
            // tabCD
            // 
            this.tabCD.Controls.Add(this.dgvCD);
            this.tabCD.Location = new System.Drawing.Point(4, 22);
            this.tabCD.Name = "tabCD";
            this.tabCD.Padding = new System.Windows.Forms.Padding(3);
            this.tabCD.Size = new System.Drawing.Size(758, 279);
            this.tabCD.TabIndex = 1;
            this.tabCD.Text = "CD";
            this.tabCD.UseVisualStyleBackColor = true;
            // 
            // tabCDTrack
            // 
            this.tabCDTrack.Controls.Add(this.dgvCDTracks);
            this.tabCDTrack.Location = new System.Drawing.Point(4, 22);
            this.tabCDTrack.Name = "tabCDTrack";
            this.tabCDTrack.Padding = new System.Windows.Forms.Padding(3);
            this.tabCDTrack.Size = new System.Drawing.Size(758, 279);
            this.tabCDTrack.TabIndex = 2;
            this.tabCDTrack.Text = "CDTracks";
            this.tabCDTrack.UseVisualStyleBackColor = true;
            // 
            // dgvOwner
            // 
            this.dgvOwner.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.dgvOwner.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOwner.Location = new System.Drawing.Point(6, 6);
            this.dgvOwner.Name = "dgvOwner";
            this.dgvOwner.Size = new System.Drawing.Size(746, 267);
            this.dgvOwner.TabIndex = 0;
            // 
            // dgvCD
            // 
            this.dgvCD.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.dgvCD.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCD.Location = new System.Drawing.Point(6, 6);
            this.dgvCD.Name = "dgvCD";
            this.dgvCD.Size = new System.Drawing.Size(746, 267);
            this.dgvCD.TabIndex = 0;
            // 
            // dgvCDTracks
            // 
            this.dgvCDTracks.BackgroundColor = System.Drawing.Color.FromArgb(((int)(((byte)(192)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.dgvCDTracks.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCDTracks.Location = new System.Drawing.Point(3, 6);
            this.dgvCDTracks.Name = "dgvCDTracks";
            this.dgvCDTracks.Size = new System.Drawing.Size(749, 267);
            this.dgvCDTracks.TabIndex = 0;
            // 
            // FormMusicStore
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.MusicStore);
            this.Name = "FormMusicStore";
            this.Text = "Music Store";
            this.MusicStore.ResumeLayout(false);
            this.tabOwner.ResumeLayout(false);
            this.tabCD.ResumeLayout(false);
            this.tabCDTrack.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOwner)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCD)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCDTracks)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl MusicStore;
        private System.Windows.Forms.TabPage tabOwner;
        private System.Windows.Forms.TabPage tabCD;
        private System.Windows.Forms.DataGridView dgvOwner;
        private System.Windows.Forms.TabPage tabCDTrack;
        private System.Windows.Forms.DataGridView dgvCD;
        private System.Windows.Forms.DataGridView dgvCDTracks;
    }
}

